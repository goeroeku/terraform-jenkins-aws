variable "ami_id" {
  type = string
  default = "ami-05fa00d4c63e32376"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "sg_id" {
  description = "The security groups assigned to the Terraform server"
}

variable "subnet_id" {
  description = "The public subnet IDs assigned to the Terraform server"
}