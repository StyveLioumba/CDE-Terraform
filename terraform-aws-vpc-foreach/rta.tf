resource "aws_route_table_association" "rt-association" {
  for_each = aws_subnet.subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.main.id
}
# resource "aws_route_table_association" "rt-association" {
#   for_each = local.subnets
#   subnet_id      = aws_subnet.subnets[each.key].id
#   route_table_id = aws_route_table.main.id
# }
