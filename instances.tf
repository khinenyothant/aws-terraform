resource "tls_private_key" "ec2_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  key_name   = "demo-key"
  # Generate a new key pair
  public_key = tls_private_key.ec2_key_pair.public_key_openssh
}

resource "aws_instance" "frontend" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.pub_sub01.id
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.pub_sg.id]

  depends_on = [
    aws_key_pair.key,
    aws_subnet.pub_sub01,
    aws_security_group.pub_sg
  ]

  tags = {
    Name = "frontend"
  }
}

resource "aws_instance" "backend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key.key_name
  subnet_id     = aws_subnet.pri_sub01.id

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.pri_sg.id]

  depends_on = [
    aws_key_pair.key,
    aws_subnet.pri_sub01,
    aws_security_group.pri_sg
  ]

  tags = {
    Name = "backend"
  }
}
