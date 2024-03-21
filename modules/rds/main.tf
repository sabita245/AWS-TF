resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_parameter_group" "db_parameter_group" {
  name   = var.parameter_group_name
  family = var.family
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_kms_key" "a" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}

resource "aws_db_instance" "rds_db_instance" {
  allocated_storage = var.allocated_storage
  db_name           = var.db_name
  engine            = var.engine
  engine_version    = var.engine_version
  #vpc_security_group_ids          = var.vpc_security_group_ids
  instance_class                = var.instance_class
  username                      = var.username
  manage_master_user_password   = var.manage_master_user_password
  master_user_secret_kms_key_id = var.master_user_secret_kms_key_id
  parameter_group_name          = var.parameter_group_name
  db_subnet_group_name          = var.db_subnet_group_name
  vpc_security_group_ids        = var.vpc_security_group_ids
  availability_zone             = var.availability_zone
  multi_az                      = var.multi_az
  publicly_accessible           = var.publicly_accessible
  allow_major_version_upgrade   = var.allow_major_version_upgrade
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  apply_immediately             = var.apply_immediately
  maintenance_window            = var.maintenance_window
  skip_final_snapshot           = var.skip_final_snapshot
  backup_window                 = var.backup_window
  backup_retention_period       = var.backup_retention_period
  max_allocated_storage         = var.max_allocated_storage
  deletion_protection           = var.deletion_protection

}
