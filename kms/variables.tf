variable "kms_key_name" {
  description = "KMS CMK name"
  default     = ""
}

variable "kms_key_alias" {
  default = "string"
  description = "KMS CMK label id"
}

variable "kms_key_label_tags" {
  type        = "map"
  default     = {}
  description = "KMS CMK label tags"
}

variable "kms_key_access_policy" {
  type        = "string"
  default     = ""
  description = "KMS CMK policy"
}

variable "deletion_window_in_days" {
  description = "KMS CMK deletion window"
  default = "7"
}

variable "enabled" {
  description = "Enable KMS CMK"
  default = true
}

variable "enable_key_rotation" {
  description = "Enable KMS CMK rotation"
  default = true
}

variable "tags" {
  description = "KMS CMK tags"
  type        = "map"
  default     = {}
}
