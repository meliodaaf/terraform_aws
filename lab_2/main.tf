resource "aws_instance" "amazon" {
  ami           = local.amazon_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [ 
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_https.id
   ]

  tags = {
    Name = "Amazon Linux 2023"
  }
}

data "aws_ami_ids" "amazon" {
  owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.2.20231113.0-kernel-6.1*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}