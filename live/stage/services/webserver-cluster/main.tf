terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # backend "s3" {
  #   # Replace this with your bucket name!
  #   # bucket
  #   key = "stage/services/webserver-cluster/terraform.tfstate"
  #   # region

  #   # Replace this with your DynamoDB table name!
  #   # dynamodb_table
  #   # encrypt
  # }
}

provider "aws" {
  region = "us-west-2"
}

module "mysql" {
  source = "../../../../modules/data-stores/mysql"

  db_name     = "stage_database"
  db_username = var.db_username
  db_password = var.db_password
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-up-and-running-state-14-04-2022"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  ami         = "ami-0892d3c7ee96c0bf7"
  server_text = "Staging for production"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 5

  enable_autoscaling   = false
}
