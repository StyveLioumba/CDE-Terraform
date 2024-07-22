resource "aws_route_table_association" "rt-association" {
  count          = local.subnet_count
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.main.id
}
