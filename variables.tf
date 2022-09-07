variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for Terraform VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for Terraform public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "my_ip" {
  description = "Your IP address"
  type        = string
  sensitive   = true
}