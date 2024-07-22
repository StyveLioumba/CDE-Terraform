resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = local.route_to_internet
    gateway_id = aws_internet_gateway.main.id
  }
}