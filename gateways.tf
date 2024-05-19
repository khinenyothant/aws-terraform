#==============INTERNET GATEWAY===============
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id

  depends_on = [aws_vpc.mainvpc]

  tags = {
    Name = "igw"
  }
}

#==============NAT-GATEWAY===============
resource "aws_eip" "ngw_eip" {
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.pub_sub01.id

  depends_on = [
    aws_subnet.pub_sub01,
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "ngw"
  }
}
