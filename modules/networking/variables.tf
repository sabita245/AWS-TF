variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "environment_name" {
  default = "test"
}
variable "public_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "allowed_ports" {
  type    = list(number)
  default = [80, 443, 22]  # Example list of allowed ports
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]  # Example list of CIDR blocks
}