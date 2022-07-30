terraform {
  backend "s3" {
    bucket         = "my-s3-bucker-1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "my-dynamoDB"
  }
}