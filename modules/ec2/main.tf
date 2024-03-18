terraform {
  required_version = ">= 0.12"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0"
    }
  }
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "tf-key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "local_file" "rsa" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.key_name
}
resource "aws_instance" "demo_ec2" {
  subnet_id     = data.aws_subnet.vpc_subnets.id
  ami           = data.aws_ami.linux.id
  key_name      = var.key_name
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
