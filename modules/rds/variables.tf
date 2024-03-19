variable "db_engine_version" {
  type    = string
  default = "5.7"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "db_instance_identifier" {
  type    = string
  default = "app-db"
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}
/*
variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type = string
  # Note: It's recommended to use sensitive variables for passwords
  #       to prevent them from being shown in plain text in the Terraform state file.
  sensitive = true
}
*/

variable "db_allocated_storage" {
  type    = number
  default = 20
}
