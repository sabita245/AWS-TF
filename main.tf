terraform {
  required_version = ">= 0.12"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0" # Specify the version constraint here
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "demo"
}

module "ec2" {
  source = "./modules/ec2"

}
module "aws-networking" {
  source = "./modules/networking"
}
module "secret" {
  source = "./modules/secret"
}
