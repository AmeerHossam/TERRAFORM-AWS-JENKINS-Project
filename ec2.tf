data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "frontend" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = module.network.public-subnet-id-1
  vpc_security_group_ids = [module.network.sg_allow_ssh_id]
  key_name               = aws_key_pair.my-keypair.key_name

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > bastion.txt && date"
  }
}

resource "aws_instance" "backend" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my-keypair.key_name
  subnet_id              = module.network.private-subnet-id-1
  vpc_security_group_ids = [module.network.sg_allow_ssh_3000_id]
}

resource "aws_instance" "frontend-2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my-keypair.key_name
  subnet_id              = module.network.public-subnet-id-2
  vpc_security_group_ids = [module.network.sg_allow_ssh_id]
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > bastion.txt"
  }
}


resource "aws_instance" "backend-2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my-keypair.key_name
  subnet_id              = module.network.private-subnet-id-2
  vpc_security_group_ids = [module.network.sg_allow_ssh_3000_id]
}