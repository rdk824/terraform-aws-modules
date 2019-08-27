
output "vpc_flow_id" {
  value       = aws_flow_log.vpc.0.id
  description = "Flow Log IDs of VPCs"
}
