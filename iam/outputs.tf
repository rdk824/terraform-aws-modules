#============================================================#
# IAM Group
#============================================================#

output "group_id" {
  value       = aws_iam_group.default.0.id
  description = "Group ID"
}

output "group_arn" {
  value       = aws_iam_group.default.0.arn
  description = "Group ARN"
}

output "group_name" {
  value       = aws_iam_group.default.0.name
  description = "Group name"
}

#============================================================#
# IAM Policy
#============================================================#

output "policy_id" {
  value       = aws_iam_policy.default.0.id
  description = "Policy ID"
}

output "policy_arn" {
  value       = aws_iam_policy.default.0.arn
  description = "Policy ARN"
}

output "policy_name" {
  value       = aws_iam_policy.default.0.name
  description = "Policy name"
}
