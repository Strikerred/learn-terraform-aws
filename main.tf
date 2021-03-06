terraform {
  cloud {
    organization = "clit-test"
    workspaces {
      name = "learn-terraform-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ee8244746ec5d6d4"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}