resource "aws_security_group" "terraform" {
    name = "terraform_sg"
    description = "Security group for Terraform server"
    vpc_id = var.vpc_id

    ingress {
        description = "Allow all traffic through port 8080"
        from_port = "8080"
        to_port = "8080"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow SSH from my computer"
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["${var.my_ip}/32"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "terraform_sg"
    }
}