output "id" {
  description = "The public IP address of the Terraform server"
  value = aws_vpc.terraform.id
}