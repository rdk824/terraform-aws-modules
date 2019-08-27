variable "name" {
  default     = ""
  description = "Name  (e.g. `bastion` or `db`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "retention_in_days" {
  description = "Number of days you want to retain log events in the log group"
  default     = "30"
}

variable "stream_names" {
  default     = []
  type        = "list"
  description = "Names of streams"
}
