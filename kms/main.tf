data "aws_caller_identity" "current" {}

resource "aws_kms_key" "kms" {
  count                   = var.enabled ? 1 : 0
  description             = "AWS KMS key ${var.kms_key_alias}"
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.enabled
  enable_key_rotation     = var.enable_key_rotation
  tags                    = var.kms_key_label_tags

  policy                  = <<KMS_POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        ]
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
KMS_POLICY

}

resource "aws_kms_alias" "kms" {
  count         = var.enabled ? 1 : 0
  name          = "alias/${var.kms_key_alias}"
  target_key_id = aws_kms_key.kms.0.key_id
}
