provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "webserver-clarence" {
  source         = "../modules/webserver"
  vpc_id         = aws_vpc.main.id
  cidr_block     = "10.0.0.0/16"
  ami            = "ami-06d4b7182ac3480fa"
  instance_type  = "t2.micro"
  webserver_name = "clarence"
}