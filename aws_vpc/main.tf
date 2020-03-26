# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags ={
    Name = var.vpc_name
  }
}


# Query all avilable Availibility Zone
data "aws_availability_zones" "available" {}