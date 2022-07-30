output "public-subnet-id-1" {
  value = aws_subnet.public-subnet-1.id
}

output "public-subnet-id-2" {
  value = aws_subnet.public-subnet-2.id
}

output "private-subnet-id-1" {
  value = aws_subnet.private-subnet-1.id
}

output "private-subnet-id-2" {
  value = aws_subnet.private-subnet-2.id
}

output "vpc-id" {
  value = aws_vpc.my_vpc.id
}

output "sg_allow_ssh_id" {
  value = aws_security_group.allow_ssh.id
}

output "sg_allow_ssh_3000_id" {
  value = aws_security_group.allow_ssh_3000.id
}

output "sg_allow_http_id" {
  value = aws_security_group.allow_http.id
}