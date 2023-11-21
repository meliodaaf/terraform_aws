locals {
  amazon_ami = distinct(data.aws_ami_ids.amazon.ids)[0]
}