variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "a_zone" {
  type    = string
  default = "ap-northeast-1a"
}

variable "pub_sub_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "pri_sub_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "ami_id" {
  type    = string
  default = "ami-02a405b3302affc24"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
