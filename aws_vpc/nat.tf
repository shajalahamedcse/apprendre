resource "aws_eip" "elastic_ip_nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elastic_ip_nat.id
  subnet_id     = aws_subnet.public_subnet.0.id
  tags ={
    Name = var.nat_gateway_name
  }
}