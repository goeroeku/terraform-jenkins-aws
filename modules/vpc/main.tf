variable "cidr_block" {}

resource "aws_vpc" "terraform" {
	cidr_block = var.cidr_block
	enable_dns_hostnames = true

	tags = {
		Name = "terraform"
	}
}