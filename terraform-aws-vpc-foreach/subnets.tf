data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnets" {
  for_each = local.subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.key
  availability_zone = each.value

  tags = {
    Name = "${local.user}-${local.date}-${each.value}"
  }
}
