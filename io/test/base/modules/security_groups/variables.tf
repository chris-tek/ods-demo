variable "vpc_id" {
  description = "ID of the VPC"
  type    = "string"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type    = "string"
}

variable "global_tags"{
  description = "List of global tags"
  type        = map(string)
}