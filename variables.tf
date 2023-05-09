variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "192.169.0.0/16"
}

variable "subnet_cidr" {
  type    = list(any)
  default = ["192.169.1.0/24", "192.169.2.0/24"]
}

variable "AZ-name" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}

variable "sg_ports" {
  type    = list(number)
  default = [22, 443, 80]
}
