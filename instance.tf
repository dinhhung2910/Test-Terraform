resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  user_data                   = file("user-data.sh")
  vpc_security_group_ids      = [aws_security_group.public.id]
  associate_public_ip_address = true
  key_name                    = var.keyname
  subnet_id                   = aws_subnet.public.id
  tags = {
    Name = "${var.author}.terraform.test"
  }
}