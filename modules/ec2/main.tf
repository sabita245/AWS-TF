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
resource "aws_instance" "demo_ec2"{
subnet_id = data.aws_subnet.vpc_subnets.id
ami = data.aws_ami.linux.id
key_name = var.key_name
instance_type = var.instance_type
tags ={
Name = var.instance_name
}
}