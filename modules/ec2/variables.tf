variable "vpc_name" {
  type    = set(string)
  default = ["app-3-vpc"]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "instance_name" {
  type    = string
  default = "webserver"
}
variable "key_name" {
  type    = string
  default = "tf-key"
}
