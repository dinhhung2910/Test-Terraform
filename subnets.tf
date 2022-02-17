resource "aws_subnet" "public" {
  depends_on = [aws_vpc.main]

  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr

  tags = {
    Name = "${var.author}.terraform.public.subnet"
  }
}

resource "aws_subnet" "private" {
  depends_on = [aws_vpc.main]

  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr

  tags = {
    Name = "${var.author}.terraform.private.subnet"
  }
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}