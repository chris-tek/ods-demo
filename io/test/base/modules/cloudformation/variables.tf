variable "cft_stack_name" {
  description = "Name for the cft stack"
  type    = "string"
}

variable "ods_sre_topic_from_cft" {
  description = "Name for the sns topic created by the stack"
  type    = "string"
}

variable "ods_sre_account_list_from_cft" {
  description = "Name for the sns topic created by the stack"
}

variable "global_tags"{
  description = "List of global tags"
  type        = map(string)
}