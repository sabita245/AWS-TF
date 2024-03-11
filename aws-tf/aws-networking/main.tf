provider "aws" {
  region  = "us-east-1"
  profile = "demo"
}
resource "aws_vpc" "demo_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "${var.environment_name}-vpc"
    Environment = var.environment_name
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name        = "${var.environment_name}-igw"
    Environment = var.environment_name
  }
}
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.environment_name}-public-route"
  }
}
data "aws_availability_zones" "az" {}
resource "aws_subnet" "public_subnet" {
  count             = 2
  cidr_block        = var.public_cidrs[count.index]
  vpc_id            = aws_vpc.demo_vpc.id
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "${var.environment_name}-public-subnet.${count.index + 1}"
  }
}
resource "aws_subnet" "private_subnet" {
  count             = 2
  cidr_block        = var.private_cidrs[count.index]
  vpc_id            = aws_vpc.demo_vpc.id
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "${var.environment_name}-private-subnet.${count.index + 1}"
  }
}
resource "aws_route_table_association" "public_subnet_assoc"{
count = 2
route_table_id = aws_route_table.public_route.id
subnet_id = aws_subnet.public_subnet.*.id[count.index]
depends_on = [aws_route_table.public_route, aws_subnet.public_subnet]
}
resource "aws_eip" "demo_eip"{
domain = "vpc"
}
resource "aws_nat_gateway" "demo_nat_gateway"{
allocation_id = aws_eip.demo_eip.id
subnet_id = aws_subnet.public_subnet.0.id
}
resource "aws_default_route_table" "private-route" {
default_route_table_id = aws_vpc.demo_vpc.default_route_table_id
route {
nat_gateway_id = aws_nat_gateway.demo_nat_gateway.id
cidr_block = "0.0.0.0/0"
}
tags = {
Name = "${var.environment_name}-private-route"
}
}
resource "aws_route_table_association" "private_subnet_assoc" {
count = 2
route_table_id = aws_default_route_table.private-route.id
subnet_id      = aws_subnet.private_subnet.*.id[count.index]
depends_on     = [aws_default_route_table.private-route, aws_subnet.private_subnet]
}
resource "aws_security_group" "demo_sg" {
  name        = "demo-security-group"
  description = "security group"

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.allowed_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks
    }
  }
}
