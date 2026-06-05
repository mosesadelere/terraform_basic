variable "aws_region" {
  default = "us-west-2"
}

variable "ingress-ports" {
  default = [80, 22, 443, 23]
}