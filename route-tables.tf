resource "aws_route_table" "public" {
  depends_on = [aws_vpc.main]
  vpc_id     = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.author}.terraform.public.route.table"
  }
}

resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.public, aws_route_table.public]
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}