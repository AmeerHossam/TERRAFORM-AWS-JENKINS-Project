resource "aws_elasticache_subnet_group" "elastiCache-subnet-group" {
  name       = "elastiCache-subnet-group"
  subnet_ids = [module.network.private-subnet-id-1]
}