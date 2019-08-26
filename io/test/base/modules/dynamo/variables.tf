variable "dynamodb_name" {
  description = "Name for the dynamo table"
  type    = "string"
  default = ""
}

variable "global_tags"{
  description = "List of global tags"
  type        = map(string)
}