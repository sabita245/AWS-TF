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