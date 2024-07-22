resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

#igw
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.main.id
}

#eip
resource "aws_eip" "nat" {
  domain = "vpc"
}

#natgw
resource "aws_nat_gateway" "main" {
  count         = 1
  allocation_id = aws_eip.nat.id
  subnet_id     = element(values(aws_subnet.public), count.index).id
  depends_on = [
    aws_eip.nat,
    aws_internet_gateway.main
  ]
}



# public subnets
resource "aws_subnet" "public" {
  for_each          = toset(var.public_subnets_cdir)
  availability_zone = element(data.aws_availability_zones.available.names, index(var.public_subnets_cdir, each.key))
  cidr_block        = each.key
  vpc_id            = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# private subnets
resource "aws_subnet" "private" {
  for_each          = toset(var.private_subnets_cdir)
  availability_zone = element(data.aws_availability_zones.available.names, index(var.private_subnets_cdir, each.key))
  cidr_block        = each.key
  vpc_id            = aws_vpc.main.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[0].id
  }
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}

#security group instance(s)
resource "aws_security_group" "allow_http_8080" {
  name        = "allow_http 8080"
  description = "Allow http inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http_8080.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

# Repondre à n'importe quel client
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http_8080.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


#security group loadbalancer
resource "aws_security_group" "allow_http_lb" {
  name        = "allow_http 80"
  description = "Allow http inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_lb_ipv4" {
  security_group_id = aws_security_group.allow_http_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_lb_ipv4" {
  security_group_id = aws_security_group.allow_http_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
