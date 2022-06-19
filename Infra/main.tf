provider "aws" {
   
}

resource "aws_lambda_function" "cadastro_usuario" {
  ###
  #Não alterar, variaveis preenchidas pela pipeline
  s3_bucket     = var.bucket
  s3_key        = var.key
  ###
  function_name = "Lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "Lambda::Lambda.Function::FunctionHandler"
  runtime       = "dotnetcore3.1"
}

erraform {
  backend "s3" {
    bucket = "state-file-terraform-bucket"
    key    = "state/statefile-lambda"
    region = "sa-east-1"
  }
}