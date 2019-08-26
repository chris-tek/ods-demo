resource "aws_dynamodb_table" "example" {
  name           = "${var.dynamodb_name}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "exampleHashKey"

  attribute {
    name = "exampleHashKey"
    type = "S"
  }

  tags = var.global_tags
}

resource "aws_dynamodb_table_item" "example1" {
  table_name = "${aws_dynamodb_table.example.name}"
  hash_key   = "${aws_dynamodb_table.example.hash_key}"

  item = <<ITEM
{
  "exampleHashKey": {"S": "something1"},
  "one": {"N": "11111"},
  "two": {"N": "22222"},
  "three": {"N": "33333"},
  "four": {"N": "44444"}
}
ITEM
}

resource "aws_dynamodb_table_item" "example2" {
  table_name = "${aws_dynamodb_table.example.name}"
  hash_key   = "${aws_dynamodb_table.example.hash_key}"

  item = <<ITEM
{
  "exampleHashKey": {"S": "something2"},
  "one": {"N": "11111"},
  "two": {"N": "22222"},
  "three": {"N": "33333"},
  "four": {"N": "44444"}
}
ITEM
}