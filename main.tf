terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block = var.vpc_cidr_block
}

module "igw" {
  source = "./modules/igw"

  vpc_id = module.vpc.id
}

module "subnet" {
  source = "./modules/subnet"

  vpc_id     = module.vpc.id
  cidr_block = var.subnet_cidr_block
  igw_id     = module.igw.id
}

module "sg" {
  source = "./modules/sg"

  vpc_id = module.vpc.id
  my_ip  = var.my_ip
}

module "vm" {
  source = "./modules/vm"

  sg_id     = module.sg.id
  subnet_id = module.subnet.id
}

