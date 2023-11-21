output "name" {
  value = "Instance Name: ${aws_instance.amazon.key_name}"
}

output "public_dns" {
  value = aws_instance.amazon.public_dns
}

output "public_ip" {
  value = aws_instance.amazon.public_ip
}

output "ssh_connect" {
  value = "ssh -i ~/.ssh/id_rsa ec2-user@$(terraform output -raw public_ip)"
}

