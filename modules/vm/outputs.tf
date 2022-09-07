output "public_ip" {
  description = "The public IP address of the Terraform server"
  value = aws_eip.terraform_eip.public_ip
}