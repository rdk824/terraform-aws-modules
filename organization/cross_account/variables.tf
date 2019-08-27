
####################################################
# Organization Member Account
####################################################
variable "aws_region" {
  type = "string"
}

variable "account_name" {
  type = "string"
}

variable "account_id" {
  type = "string"
}

variable "account_role_name" {
  type        = "string"
  description = "IAM role that Organization automatically preconfigures in the new member account"
  default     = "OrganizationAccountAccessRole"
}

#-------------------------------------------
### IAM AssumeRole
#--------------------------------------------
variable "create_cross_account_roles" {
  description = "Create IAM roles for the Accounts"
  default     = false
}

variable "cross_account_params" {
  type    = "list"
  default = []
}
