variable "sns_topic_name" {
  description = "Name for the sns topic"
  type    = "string"
  default = ""
}

variable "global_tags"{
  description = "List of global tags"
  type        = map(string)
}