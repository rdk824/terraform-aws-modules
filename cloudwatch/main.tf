
resource "aws_cloudwatch_log_group" "default" {
  name              = var.name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

resource "aws_cloudwatch_log_stream" "default" {
  count          = length(var.stream_names)
  name           = element(var.stream_names, count.index)
  log_group_name = aws_cloudwatch_log_group.default.name
}
