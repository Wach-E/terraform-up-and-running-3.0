terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    # Replace this with your bucket name!
    # bucket
    key = "prod/services/webserver-cluster/terraform.tfstate"
    # region =

    # Replace this with your DynamoDB table name!
    # dynamodb_table
    # encrypt
  }
}

provider "aws" {
  region = "us-west-2"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraform-up-and-running-state-14-04-2022"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 10

  custom_tags = {
    Owner     = "team-foo"
    ManagedBy = "terraform"
  }

  enable_autoscaling = true
}
