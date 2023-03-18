terraform {
  required_providers {
    dnsimple = {
      source = "dnsimple/dnsimple"
      version = "0.11.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.69.0"
    }
  }
}