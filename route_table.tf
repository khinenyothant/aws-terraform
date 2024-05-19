resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  depends_on = [aws_vpc.mainvpc, aws_internet_gateway.igw]

  tags = {
    Name = "pub_rt"
  }
}

resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  depends_on = [aws_vpc.mainvpc, aws_nat_gateway.ngw]

  tags = {
    Name = "pri_rt"
  }
}

resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.pub_sub01.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pri" {
  subnet_id      = aws_subnet.pri_sub01.id
  route_table_id = aws_route_table.pri_rt.id
}
