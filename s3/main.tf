resource "aws_s3_bucket" "default" {
  count         = "${var.logging_enabled ? 0 : 1}"
  bucket        = "${var.bucket_name}"
  acl           = "${var.acl}"
  region        = "${var.region}"
  force_destroy = "${var.force_destroy}"
  policy        = "${var.policy}"

  # logging = ["${var.logging}"]

  versioning {
    enabled = "${var.versioning_enabled}"
  }

  lifecycle_rule {
    id      = "${var.bucket_name}"
    enabled = "${var.lifecycle_rule_enabled}"

    # prefix = "${var.prefix}"
    tags   = "${var.tags}"

    noncurrent_version_expiration {
      days = "${var.noncurrent_version_expiration_days}"
    }

    noncurrent_version_transition {
      days          = "${var.noncurrent_version_transition_days}"
      storage_class = "GLACIER"
    }

    transition {
      days          = "${var.standard_transition_days}"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "${var.glacier_transition_days}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.expiration_days}"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "${var.sse_algorithm}"
        kms_master_key_id = "${var.kms_master_key_id}"
      }
    }
  }

  tags = "${var.tags}"
}


resource "aws_s3_bucket" "with_logging" {
  count         = "${var.logging_enabled ? 1 : 0}"
  bucket        = "${var.bucket_name}"
  acl           = "${var.acl}"
  region        = "${var.region}"
  force_destroy = "${var.force_destroy}"
  policy        = "${var.policy}"

  logging {
    target_bucket = "${var.logging_target_bucket}"
  }

  versioning {
    enabled = "${var.versioning_enabled}"
  }

  lifecycle_rule {
    id      = "${var.bucket_name}"
    enabled = "${var.lifecycle_rule_enabled}"

    # prefix = "${var.prefix}"
    tags   = "${var.tags}"

    noncurrent_version_expiration {
      days = "${var.noncurrent_version_expiration_days}"
    }

    noncurrent_version_transition {
      days          = "${var.noncurrent_version_transition_days}"
      storage_class = "GLACIER"
    }

    transition {
      days          = "${var.standard_transition_days}"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "${var.glacier_transition_days}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.expiration_days}"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "${var.sse_algorithm}"
        kms_master_key_id = "${var.kms_master_key_id}"
      }
    }
  }

  tags = "${var.tags}"
}
