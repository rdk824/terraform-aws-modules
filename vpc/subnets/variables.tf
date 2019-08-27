variable "namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
  type        = "string"
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = "string"
}

variable "name" {
  description = "Name  (e.g. `app` or `cluster`)"
  type        = "string"
}

#=====================================================#
# Subnets
#=====================================================#

variable "availability_zones" {
  type        = "list"
  default     = []
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}

variable "max_subnets" {
  default     = "6"
  description = "Maximum number of subnets that can be created. The variable is used for CIDR blocks calculation"
}

variable "vpc_id" {
  type        = "string"
  description = "VPC ID"
}

variable "cidr_block" {
  type        = "string"
  description = "Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)"
}

variable "igw_id" {
  type        = "string"
  description = "Internet Gateway ID that is used as a default route when creating public subnets (e.g. `igw-9c26a123`)"
  default     = ""
}

variable "az_ngw_ids" {
  type        = "list"
  description = "Only for private subnets. Map of AZ names to NAT Gateway IDs that are used as default routes when creating private subnets"
  default     = []
}

##-- Public Subnet
variable "create_public_subnet" {
  description = "Whether to create public subnet or not"
  default     = false
}

variable "public_label_id" {
  description = "Public Network label id"
  default     = ""
}

variable "public_label_tags" {
  description = "Public Network label tags"
  default     = {}
}

variable "public_network_acl_id" {
  type        = "string"
  description = "Network ACL ID that is added to the public subnets. If empty, a new ACL will be created"
  default     = ""
}

variable "public_network_acl_rules_count" {
  description = "Number of public network ACL rules"
  type        = "string"

  default = 0
}

variable "public_network_acl_rules" {
  description = "Public network ACL rules"
  type        = "list"

  default = []
}

variable "create_nat_gateway" {
  description = "Whether not to create NAT Gateways in public subnets"
  default     = false
}

variable "az_ngw_count" {
  description = "Count of items in the `az_ngw_ids` map. Needs to be explicitly provided since Terraform currently can't use dynamic count on computed resources from different modules. https://github.com/hashicorp/terraform/issues/10857"
  default     = 0
}

##-- Private Subnet
variable "create_private_subnet" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default     = false
}

variable "private_label_id" {
  description = "Private Network lable ID"
  default     = ""
}

variable "private_label_tags" {
  description = "Private Network label tags"
  default     = {}
}

variable "private_network_acl_id" {
  type        = "string"
  description = "Network ACL ID that is added to the private subnets. If empty, a new ACL will be created"
  default     = ""
}

variable "private_network_acl_rules" {
  description = "Private network ACL rules"
  type        = "list"

  default = []
}

variable "private_network_acl_rules_count" {
  description = "Number of private network ACL rules"
  type        = "string"

  default = 0
}
