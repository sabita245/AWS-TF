/*
variable "vpc_name" {
  type    = set(string)
  default = ["app-3-vpc"]
}
*/
#variable "subnet_id" {
# description = "The ID of the subnet in which to launch the EC2 instance"
# type        = string

#}

variable "ami" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0d7a109bf30624c99"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "name" {
  type    = string
  default = "webserver"
}
variable "key_name" {
  type    = string
  default = "tf-key"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_cidrs" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "allocated_storage" {
  default     = null
  type        = number
  description = "maximum strorage size"
}
variable "db_name" {
  type    = string
  default = null
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "username" {
  type = string
}
variable "manage_master_user_password" {
  type    = bool
  default = true
}
variable "master_user_secret_kms_key_id" {
  type    = string
  default = null
}
variable "db_subnet_group_name" {
  type = string
}
variable "parameter_group_name" {
  type = string
}
/*
variable "vpc_security_group_ids" {
  type = list(string)
}
*/
variable "availability_zone" {
  default = null
  type    = string
}
variable "multi_az" {
  type = bool
}
variable "publicly_accessible" {
  default = null
  type    = bool
}
variable "allow_major_version_upgrade" {
  type = bool
}
variable "auto_minor_version_upgrade" {
  type = bool
}
variable "apply_immediately" {
  default = null
  type    = bool
}
variable "maintenance_window" {
  type    = string
  default = null
}
variable "backup_retention_period" {
  type = number
}
variable "skip_final_snapshot" {
  type = bool
}
variable "backup_window" {
  type    = string
  default = null
}
variable "max_allocated_storage" {
  default = null
  type    = number

}
variable "deletion_protection" {
  type = bool
}
variable "family" {
  type = string
}
#variable "subnet_ids" {
# type = list(string)
#}
