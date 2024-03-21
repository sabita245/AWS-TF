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
variable "vpc_security_group_ids" {
  type = list(string)
}
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
variable "skip_final_snapshot" {
  type    = bool
  default = null
}
variable "backup_window" {
  type    = string
  default = null
}
variable "backup_retention_period" {
  type = number
}
variable "max_allocated_storage" {
  default = null
  type    = number

}
variable "deletion_protection" {
  type    = bool
  default = null
}
/*
variable "vpc_security_group_ids" {
  type = list(string)
}
*/
variable "subnet_ids" {
  type = list(string)
}
variable "family" {
  type = string
}
