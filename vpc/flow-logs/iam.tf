data "aws_iam_policy_document" "log_assume" {
  count = var.enable_flow_logs ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "log" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "cwl" {
  count  = var.enable_flow_logs ? 1 : 0
  name   = "${var.flow_logs_label_id}-to-cwl-policy"
  role   = aws_iam_role.cwl_flow_log.0.id
  policy = data.aws_iam_policy_document.log.json
}

resource "aws_iam_role" "cwl_flow_log" {
  count              = var.enable_flow_logs ? 1 : 0
  name               = "${var.flow_logs_label_id}-to-cwl-role"
  assume_role_policy = data.aws_iam_policy_document.log_assume.0.json
}
