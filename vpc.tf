resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc01"
  }
}

resource "aws_subnet" "pub_sub01" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.pub_sub_cidr
  availability_zone = var.a_zone

  depends_on = [aws_vpc.mainvpc]

  tags = {
    Name = "pub_sub01"
  }
}

resource "aws_subnet" "pri_sub01" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.pri_sub_cidr
  availability_zone = var.a_zone

  depends_on = [aws_vpc.mainvpc]

  tags = {
    Name = "pri_sub01"
  }
}
