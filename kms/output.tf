output "kms_arn" {
  value = join("", aws_kms_key.kms.*.arn)
}

output "kms_key_id" {
  value = join("", aws_kms_key.kms.*.key_id)
}
