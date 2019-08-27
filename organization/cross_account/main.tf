
#===============================================================================
# IAM Cross Account Role
#===============================================================================

#-------------------------------------------
### IAM Role
#--------------------------------------------
resource "aws_iam_role" "cross_account_role" {
  count = var.create_cross_account_roles ? length(var.cross_account_params) : 0
  name =  lookup(var.cross_account_params[count.index], "role_name", "")
  assume_role_policy = element(data.aws_iam_policy_document.cross_account_policy.*.json, count.index)
}

data "aws_iam_policy_document" "cross_account_policy" {
  count = var.create_cross_account_roles ? length(var.cross_account_params) : 0
  statement {
    sid = "AdministratorAccessRole"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [lookup(var.cross_account_params[count.index], "principal_arn", "")]
    }

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

#-------------------------------------------
### IAM Access Policy
#--------------------------------------------
resource "aws_iam_policy" "iam_policy" {
  count = var.create_cross_account_roles ? length(var.cross_account_params) : 0

  name        =  lookup(var.cross_account_params[count.index], "policy_name", "")
  path        = "/"
  description = "Cross-account policy for ${lookup(var.cross_account_params[count.index], "role_name", "")}"
  policy      = file( lookup(var.cross_account_params[count.index], "policy_file", "") )
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count = var.create_cross_account_roles ? length(var.cross_account_params) : 0

  role       = element(aws_iam_role.cross_account_role.*.name, count.index)
  policy_arn = element(aws_iam_policy.iam_policy.*.arn, count.index)
}
