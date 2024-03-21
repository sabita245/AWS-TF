terraform {
  required_version = ">= 0.12"
}
/*
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0" # Specify the version constraint here
    }
  }
}
*/

module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  #subnet_id     = var.subnet_id
  ami                    = var.ami
  key_name               = var.key_name
  name                   = var.name
  subnet_id              = module.aws-networking.public_subnets[0]
  vpc_security_group_ids = [module.aws-networking.sg]
  depends_on             = [module.aws-networking]

}
module "aws-networking" {
  source        = "./modules/networking"
  vpc_cidr      = var.vpc_cidr
  private_cidrs = var.private_cidrs
  public_cidrs  = var.public_cidrs



}

module "rds" {
  source                        = "./modules/rds"
  allocated_storage             = var.allocated_storage
  db_name                       = var.db_name
  engine                        = var.engine
  engine_version                = var.engine_version
  instance_class                = var.instance_class
  username                      = var.username
  manage_master_user_password   = var.manage_master_user_password
  master_user_secret_kms_key_id = var.master_user_secret_kms_key_id
  vpc_security_group_ids        = [module.aws-networking.sg]
  parameter_group_name          = var.parameter_group_name
  db_subnet_group_name          = var.db_subnet_group_name
  #vpc_security_group_ids        = var.vpc_security_group_ids
  availability_zone           = var.availability_zone
  multi_az                    = var.multi_az
  publicly_accessible         = var.publicly_accessible
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window
  skip_final_snapshot         = var.skip_final_snapshot
  backup_window               = var.backup_window
  max_allocated_storage       = var.max_allocated_storage
  deletion_protection         = var.deletion_protection
  backup_retention_period     = var.backup_retention_period
  family                      = var.family
  subnet_ids                  = [module.aws-networking.private_subnets[0], module.aws-networking.public_subnets[1]]
  #name                          = var.parameter_group_name
  #name       = var.db_subnet_group_name
  depends_on = [module.aws-networking]
}
