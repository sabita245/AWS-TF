resource "aws_instance" "demo_ec2"{
subnet_id = data.aws_subnet.vpc_subnets.id
ami = data.aws_ami.linux.id
instance_type = var.instance_type
tags ={
Name = var.instance_name
}
}