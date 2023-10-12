provider "aws" {
  region = "us-east-1"
}

# Define Lambda function
resource "aws_lambda_function" "test_lambda_function" {
  function_name = "test-lambda-function"
  handler      = "index.handler"
  runtime      = "nodejs18.x"
  role         = aws_iam_role.lambda_role.arn
  layers       = [data.aws_lambda_layer_version.my_layer.arn]

  # Function code
  filename     = "lambda/handler.zip"
  source_code_hash = filebase64sha256("path/to/lambda.zip")
}

# Define the IAM role the Lambda function
resource "aws_iam_role" "test-lambda_role" {
  name = "test-lambda-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}