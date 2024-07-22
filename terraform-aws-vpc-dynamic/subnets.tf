data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, 0)
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  availability_zone = data.aws_availability_zones.available.names[1]
}

# resource "aws_subnet" "a" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = element(local.subnets_cdir, 0)
#   availability_zone = join("", [var.region, element(var.subnets_name, 0)])
# }

# resource "aws_subnet" "b" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = element(local.subnets_cdir, 1)
#   availability_zone = join("", [var.region, element(var.subnets_name, 1)])
# }