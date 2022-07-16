resource "aws_db_subnet_group" "my-rds-subnet-group" {
  name       = "my-subnet-group"
  subnet_ids = [module.network.private-subnet-id-1,module.network.private-subnet-id-2]

}