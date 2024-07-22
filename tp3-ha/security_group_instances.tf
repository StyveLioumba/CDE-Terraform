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
