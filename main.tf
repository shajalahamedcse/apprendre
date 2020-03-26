provider "aws" {
  region = "ap-southeast-1"
}

module "vpc_networking" {
  source = "./aws_vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "hello-vpc"
  internet_gateway_name = "hello-igw"
  public_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnet_name_prefix = "hello-public"
}
