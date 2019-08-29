output "kms_arn" {
  value = join("", aws_kms_key.kms.0.arn)
}

output "kms_key_id" {
  value = join("", aws_kms_key.kms.0.key_id)
}
