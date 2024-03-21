
/*
variable "vpc_name" {
  type    = set(string)
  default = ["app-3-vpc"]
}
*/

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
variable "ami" {
  type        = string
  description = "ami id for instance"
}
variable "subnet_id" {
  default = ""
  type    = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}
