provider "aws" {
    region = "us-east-1"
    profile = "demo"
}

module "ec2" {
    source = "./modules/ec2"
    
}
module "aws-networking" {
    source = "./modules/networking"
    
}