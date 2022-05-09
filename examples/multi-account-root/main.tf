provider "aws" {
  region = "us-west-2"
  alias  = "parent"
}

provider "aws" {
  region = "us-west-2"
  alias  = "child"

  assume_role {
    role_arn = "arn:aws:iam::953643278386:role/OrganizationAccountAccessRole"
  }
}

data "aws_caller_identity" "parent" {
  provider = aws.parent
}

data "aws_caller_identity" "child" {
  provider = aws.child
}