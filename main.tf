provider "aws" {
  region = "ap-southeast-1"
}

module "vpc_networking" {
  #------------------#
  source = "./aws_vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "hello-vpc"
  #--------------------#

  internet_gateway_name = "hello-igw"
  #---------------------#

  public_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnet_name_prefix = "hello-public"
  public_route_table_name = "public-route-table"
  #-----------------------#

  nat_gateway_name = "hello-nat"

  #-----------------------#
  private_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  private_subnet_name_prefix = "hello-private"
  private_route_table_name = "private-route-table"

  #------------------------#


}
