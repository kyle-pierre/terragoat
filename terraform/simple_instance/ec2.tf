provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "4f7ea159196deaa23e77b219fe839518dae0d7ac"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-30 15:35:08"
    git_last_modified_by = "67285506+kyle-pierre@users.noreply.github.com"
    git_modifiers        = "67285506+kyle-pierre"
    git_org              = "kyle-pierre"
    git_repo             = "terragoat"
    yor_trace            = "31252dc3-77cd-4e5f-994b-69f4bb044c13"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "4f7ea159196deaa23e77b219fe839518dae0d7ac"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-30 15:35:08"
    git_last_modified_by = "67285506+kyle-pierre@users.noreply.github.com"
    git_modifiers        = "67285506+kyle-pierre"
    git_org              = "kyle-pierre"
    git_repo             = "terragoat"
    yor_trace            = "de5c5b00-db75-4b2c-a403-6684402d09fe"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
