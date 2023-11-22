resource "aws_instance" "amazon" {
  ami           = local.amazon_ami
  instance_type = "t2.micro"
  key_name      = "aws_key"
  vpc_security_group_ids = [
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_https.id,
    aws_security_group.sg_http.id,
    aws_security_group.various_ports.id
  ]

  user_data = file("./scripts/code-script.yml")

  tags = {
    # formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
    Name = "Amazon-EC2-${formatdate("MM-DD-YY", timestamp())}"
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = var.ssh_public_key
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