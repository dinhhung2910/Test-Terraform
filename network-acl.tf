resource "aws_network_acl" "public" {
  depends_on = [aws_vpc.main]
  vpc_id     = aws_vpc.main.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 201
    action     = "allow"
    cidr_block = var.svmc_cidr
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = var.svmc_cidr
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "${var.author}.terraform.public.nacl"
  }
}

resource "aws_network_acl_association" "public" {
  depends_on = [aws_subnet.public.id, aws_network_acl.public.public_subnet.id]

  network_acl_id = aws_network_acl.public.id
  subnet_id      = aws_subnet.public.id
}