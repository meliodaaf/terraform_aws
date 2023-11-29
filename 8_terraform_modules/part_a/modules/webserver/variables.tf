variable "vpc_id" {
  type = string
  description = "AWS VPC ID"
}

variable "cidr_block" {
  type = string
  description = "VPC CIDR BLOCK"
}

variable "ami" {
  type = string
  description = "EC2 Instance AMI ID"
}

variable "instance_type" {
  type = string
  description = "EC2 Instance Type"
}

variable "webserver_name" {
  type = string
  description = "EC2 Webserver instance name"
}