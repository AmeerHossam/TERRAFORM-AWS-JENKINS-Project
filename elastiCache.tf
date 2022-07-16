resource "aws_elasticache_cluster" "my-redis" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.elastiCache-subnet-group.name
  security_group_ids   = [module.network.sg_allow_ssh_3000_id]
}


