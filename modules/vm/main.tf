resource "aws_instance" "terraform" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = [var.sg_id]
  key_name                = aws_key_pair.terraform_key.key_name
  user_data               = "${file("${path.module}/install.sh")}"

  tags = {
    Name = "terraform"
  }
}

resource "aws_key_pair" "terraform_key" {
  key_name    = "terraform_key"
  public_key  = file("${path.module}/terraform.pub")
}

resource "aws_eip" "terraform_eip" {
  instance = aws_instance.terraform.id
  vpc      = true

  tags = {
      Name = "terraform_eip"
  }
}