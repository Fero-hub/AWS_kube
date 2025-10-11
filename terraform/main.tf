terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket         = "tfstate-s3-mojstate" 
    key            = "terraform/state/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "main_vpc"
  }
}

resource "random_id" "suffix" {
  byte_length = 8
}

