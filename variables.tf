data "archive_file" "lambda_handler" {
  type = "zip"
  source_file = "../lambda/handler.js"
  output_path = "lambda_function.zip"
}