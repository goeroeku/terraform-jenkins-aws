variable "vpc_id" {}
variable "cidr_block" {}
variable "igw_id" {}

data "aws_availability_zones" "available" {
	state = "available"
}

resource "aws_subnet" "public" {
	vpc_id = var.vpc_id

	cidr_block = var.cidr_block
	availability_zone = data.aws_availability_zones.available.names[0]

	tags = {
		Name = "terrraform_public_subnet_1"
	}
}

resource "aws_route_table" "public_rt" {
	vpc_id = var.vpc_id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = var.igw_id
	}
}

resource "aws_route_table_association" "public_rt_ass" {
	route_table_id = aws_route_table.public_rt.id
	subnet_id = aws_subnet.public.id
}