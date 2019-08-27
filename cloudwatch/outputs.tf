output "log_group_arn" {
  value       = aws_cloudwatch_log_group.default.arn
  description = "ARN of the log group"
}

output "stream_arns" {
  value       = aws_cloudwatch_log_stream.default.*.arn
  description = "ARN of the log stream"
}

output "log_group_name" {
  description = "Name of log group"
  value       = aws_cloudwatch_log_group.default.name
}
