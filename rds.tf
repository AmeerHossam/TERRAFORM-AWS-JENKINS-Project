resource "aws_db_instance" "my-RDS-mySQL" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.my-rds-subnet-group.name
  vpc_security_group_ids = [module.network.sg_allow_ssh_3000_id]
}