data "aws_vpc" "vpc" {
filter {
    name   = "tag:Name"
    values = var.vpc_name
  }
}
data "aws_subnet" "vpc_subnets" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = "app-3-subnet-public"
  }
}
data "aws_ami" "linux" {
   most_recent = true
   owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


