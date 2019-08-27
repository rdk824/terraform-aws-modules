
resource "aws_flow_log" "vpc" {
  count           = var.enable_flow_logs ? 1 : 0
  log_destination = var.cwl_log_group_name
  iam_role_arn    = aws_iam_role.cwl_flow_log.0.arn
  vpc_id          = var.vpc_id
  traffic_type    = var.traffic_type
}
