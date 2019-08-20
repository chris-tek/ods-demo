resource "aws_lambda_function" "test_lambda" {
  #filename      = "ods-sre-test-lambda.zip"
  
  s3_bucket     = "chris-ijames-test-bucket-2"
  s3_key        = "lambda/chris-ijames-test-lambda.zip"
  
  function_name = "ods-sre-test-lambda"
  #role          = "${aws_iam_role.iam_for_lambda.arn}"
  role          = "arn:aws:iam::045627890776:role/service-role/chris-ijames-test-role-wb7ftqr1"
  handler       = "lambda_function.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = "${filebase64sha256("ods-sre-test-lambda.zip")}"

  runtime = "python3.7"

  environment {
    variables = {
      foo = "bar"
    }
  }
  
  tags = {
    Source = "Terraform"
    Name   = "ods_sre_test_terraform"
    Owner  = "ods-sre"
    POC    = "ods-sre"
    System = "ods-sre"
  }
}