variable "vpc_cidr" {
  type = string
  description = "VPC cidr"
}

variable "vpc_name" {
  type = string
  description = "VPC Name"

}

variable "internet_gateway_name" {
  type = string
  description = "Internet Gateway Name"

}

variable "public_subnet_name_prefix" {
  type = string
  description = "Public Subnet Name prefix for subnet naming"
}

variable "private_subnet_name_prefix" {
  type = string
  description = "Public Subnet Name prefix for subnet naming"
}

variable "public_cidrs" {
  type = list(string)
}

variable "private_cidrs" {
  type = list(string)
}

variable "nat_gateway_name" {
  type = string
}