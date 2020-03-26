# Public Subnet
resource "aws_subnet" "public_subnet" {
  count = length(var.public_cidrs)
  cidr_block = var.public_cidrs[count.index]
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

    tags = {
    Name = "${var.public_subnet_name_prefix}:${count.index + 1}"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  count = length(var.private_cidrs)
  cidr_block = var.private_cidrs[count.index]
  vpc_id = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]

    tags = {
    Name = "${var.private_subnet_name_prefix}:${count.index + 1}"
  }
}