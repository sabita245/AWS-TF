provider "aws" {
  region  = var.aws_region
  profile = "demo"
}
data "aws_vpc" "vpc" {
filter {
    name   = "tag:Name"
    values = var.vpc_name
  }
}
resource "aws_instance" "demo_ec2"{
subnet_id = data.aws_vpc.vpc.subnet_ids[0]
ami = data.aws_ami.ubuntu.id
instance_type = var.instance_type
tags ={
Name = var.instance_name
}
}
