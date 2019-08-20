output "my_new_dynamodb_table_arn" {
  value = "${aws_dynamodb_table.example.arn}"
}

output "my_new_dynamodb_table_id" {
  value = "${aws_dynamodb_table.example.id}"
} 