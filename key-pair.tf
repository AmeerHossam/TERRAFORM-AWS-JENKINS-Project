resource "tls_private_key" "RSA-keypair" {
  algorithm = "RSA"
}

resource "aws_key_pair" "my-keypair" {
  key_name   = "my-keypair"
  public_key = tls_private_key.RSA-keypair.public_key_openssh
  tags = {
    "Name" = "test-keypair"
  }
}

resource "aws_secretsmanager_secret" "sm-keypairs" {
  name                    = "my-SM"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "sm-v" {
  secret_id     = aws_secretsmanager_secret.sm-keypairs.id
  secret_string = tls_private_key.RSA-keypair.private_key_pem

}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.my-keypair.key_name}.pem"
  content  = tls_private_key.RSA-keypair.private_key_pem
}
resource "local_file" "ssh_puplic_key" {
  filename = "${aws_key_pair.my-keypair.key_name}.pub"
  content  = tls_private_key.RSA-keypair.public_key_openssh
}