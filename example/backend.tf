terraform {
  backend "s3" {
    bucket = "example-bucket"
    key    = "peering/example/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  namespace   = "peering-example"
  environment = "dev"
  region      = "us-east-1"
}
