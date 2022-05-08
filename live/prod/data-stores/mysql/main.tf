terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    # The comments in this backend is configured through backend.hcl!
    # bucket 
    key = "prod/data-stores/mysql/terraform.tfstate"
    # region
    # dynamodb_table
    # encrypt
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running-prod"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = "prod_database"

  # How should we set the username and password?
  username = var.db_username
  password = var.db_password
}
