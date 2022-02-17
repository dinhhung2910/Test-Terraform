resource "aws_security_group" "public" {
  name        = "${var.author}.terraform.public"
  description = "Allow HTTPS outbound to anywhere and SSH inbound from SVMC"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH From SVMC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.svmc_cidr]
  }

  egress {
    description = "HTTPS to the beautiful world outside"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.author}.terraform.public"
  }
}

output "public_sg_id" {
  value = aws_security_group.public.id
}