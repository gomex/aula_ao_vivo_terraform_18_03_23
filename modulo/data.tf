data "aws_vpc" "main" {
  state = "available"
  filter {
    name   = "tag:Environment"
    values = ["${terraform.workspace}"]
  }
}

data "aws_subnet_ids" "main" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name = "vpc-${terraform.workspace}-${var.subnet_tier}-${var.az}"
  }
}