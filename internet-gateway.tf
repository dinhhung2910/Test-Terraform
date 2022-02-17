resource "aws_internet_gateway" "gw" {
  depends_on = [aws_vpc.main]
  vpc_id     = aws_vpc.main.id
  tags = {
    Name = "${var.author}.terraform.igw"
  }
}

output "igw_id" {
  value = aws_internet_gateway.gw.id
}
