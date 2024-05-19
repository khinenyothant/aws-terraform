output "vpc_id" {
  value = aws_vpc.mainvpc.id
}

output "public_subnet_id" {
  value = aws_subnet.pub_sub01.id
}

output "private_subnet_id" {
  value = aws_subnet.pri_sub01.id
}

output "public_ec2_address" {
  value = aws_instance.frontend.public_ip
}
