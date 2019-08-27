#============================================================#
# IAM Groups
#============================================================#
variable "create_group" {
  type        = bool
  default     = false
  description = "Set to true if you want to create a group"
}

variable "group_name" {
  type        = "string"
  default     = ""
  description = "Name for the group "
}

variable "group_policy" {
  type        = "string"
  default     = ""
  description = "IAM policy to attach to the group"
}
#============================================================#
# IAM Group Policy
#============================================================#
variable "create_iam_policy" {
  type        = bool
  default     = false
  description = "Set to true if you want to create a group policy"
}

variable "policy_name" {
  type        = "string"
  default     = ""
  description = "Name for the group"
}

variable "policy" {
  type        = "string"
  default     = ""
  description = "Policy to attach to the group"
}

variable "create_policy_attachment" {
  type        = bool
  default     = false
  description = "Policy source attachment"
}

#============================================================#
# IAM Users
#============================================================#
variable "create_user" {
  type        = bool
  default     = false
  description = "Set to true if you want to create a user"
}

variable "user_group_name" {
  type        = "string"
  default     = ""
  description = "The user group name"
}

variable "users" {
  type        = "list"
  default     = [
    {
      user_name     = "deployment"
      path          = "/"
      force_destroy = "false"
    },
  ]
  description = "list of IAM users to create in a single group"
}
