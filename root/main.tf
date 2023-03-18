terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.69.0"
    }
  }
}

provider "aws" {
  region = local.region["${terraform.workspace}"]
}

terraform {
  backend "s3" {
    bucket = "descomplicandoterraformaovivo180323"
    key    = "linuxtips"
    region = "us-east-2"
  }
}