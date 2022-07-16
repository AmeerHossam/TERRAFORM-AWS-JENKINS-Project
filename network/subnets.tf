resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "${var.region-1}a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-1"
  }
}
resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "${var.region-1}b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-2"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "${var.region-1}a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private-1"
  }
}
resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "${var.region-1}b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private-2"
  }
}