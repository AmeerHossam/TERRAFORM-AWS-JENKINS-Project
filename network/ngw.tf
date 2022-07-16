resource "aws_nat_gateway" "NGW" {
  allocation_id = aws_eip.NAT_EIP.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "gw NAT"
  }
}