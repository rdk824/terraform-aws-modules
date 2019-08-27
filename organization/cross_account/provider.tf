provider "aws" {
  region = "${var.aws_region}"

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/${var.account_role_name}"
  }
}
