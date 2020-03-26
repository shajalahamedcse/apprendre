# Public Route Table

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

# Associate Public Route Table with Public Subnet
resource "aws_route_table_association" "public_subnet_assoc" {
  count          = length(aws_subnet.private_subnet)
  route_table_id = aws_route_table.public_route.id
  subnet_id      = aws_subnet.public_subnet.*.id[count.index]
  depends_on     = ["aws_route_table.public_route", "aws_subnet.public_subnet"]
}

# Private Route Table

resource "aws_default_route_table" "private_route" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
    cidr_block     = "0.0.0.0/0"
  }

  tags = {
    Name = var.private_route_table_name
  }
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_subnet_assoc" {
  count          = 2
  route_table_id = aws_default_route_table.private_route.id
  subnet_id      = aws_subnet.private_subnet.*.id[count.index]
  depends_on     = ["aws_default_route_table.private_route", "aws_subnet.private_subnet"]
}
