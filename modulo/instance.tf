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

resource "aws_key_pair" "main" {
  key_name   = "gomex-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5t4cjtIm82R7BDTz/iWI5RVX4EuN85Tatdi80Ju8Lh/K2HfmyqTL0uWDsdAtpqA94fNQld/WfxV0i/F9RMg5C5zyJyHvOxzuYKPwt8xLOQr3sBrEeWx/DZQl7CW1kM9Rg6VC0UdqHlD2CC91yBS/liFo7lZaF0a5oSmTYxvtqpBOFm4ZP8HJrOZrZVNVG9MgQJFTmpF7u0sdT2BerbmfeBEa20ahv9ClBIPUMIaicMntY5Jv3Qc9vIS2kOV36Etk/l9NklSl1GN+X3GKxX+FbD+k9x6lEgWk6h0uEQKvVNmi4R2Zle4ufopcqXozy8bn1rY0lomcaUTDV85BE/CNRfHZKychjjwnPlzE/CYfJTJqBbG/29OQLLViCfTbJlR21obznrnIpUl8Xj/tlPr8AVuICySHFEnjeaH9nNLUcwsaue0URIRSo1n9OgTlLgltGWkMt/baPNxv4XHMMwxRzaEunhI54+2U0Oq/8oZqeCu5o/dM1+2onPBk1Bx2tQL8= rgomes@DNSF-080-DEVOPSENG-RG.local"
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.main.id}"]
  subnet_id     = tolist(data.aws_subnet_ids.main.ids)[0]
  key_name      = "descomplicando_terraform"

  root_block_device {
    volume_type = var.root_block_device_volume_type
    volume_size = var.root_block_device_volume_size
    delete_on_termination = var.root_block_device_delete_on_termination
    tags = {
      instance = var.hostname
    }
  }

  lifecycle {
    ignore_changes = [
      ami,
    ]
  }

  tags = {
    Name = var.hostname
  }
  user_data = <<EOF
#!/bin/bash
sudo hostnamectl set-hostname ${var.hostname}.${var.domain}
EOF
}

## Elastic IP

resource "aws_eip" "main" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.main.id
  allocation_id = aws_eip.main.id
}
