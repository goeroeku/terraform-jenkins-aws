variable "vpc_id" {}

resource "aws_internet_gateway" "public" {
	vpc_id = var.vpc_id

	tags = {
		Name = "terraform_igw"
	}
}