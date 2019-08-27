
output "bucket_domain_name" {
  value       = "${var.logging_enabled ? join("", aws_s3_bucket.with_logging.*.bucket_domain_name) : join("", aws_s3_bucket.default.*.bucket_domain_name)}"
  description = "FQDN of bucket"
}

output "bucket_id" {
  value       = "${var.logging_enabled ? join("", aws_s3_bucket.with_logging.*.id) : join("", aws_s3_bucket.default.*.id)}"
  description = "Bucket Name (aka ID)"
}

output "bucket_arn" {
  value       = "${var.logging_enabled ? join("", aws_s3_bucket.with_logging.*.arn) : join("", aws_s3_bucket.default.*.arn)}"
  description = "Bucket ARN"
}
