variable "vpc_name"{
    type = set(string)
default = ["app-vpc"]
}
variable "aws_region"{
default = "us-east-1"
}
variable "instance_type"{
default = "t2.micro"
}
variable "instance_name"{
default = "webserver"
}
