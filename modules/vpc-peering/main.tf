data "aws_caller_identity" "current" {}

data "aws_vpc" "primary_vpc" {
  tags = {
    Name = "${var.primary_vpc_name}-vpc"
  }
}

data "aws_vpc" "utility_vpc" {
  tags = {
    Name = "${var.utility_vpc_name}-vpc"
  }
}

/**
 * VPC peering:
 *
 * 1. Establish Peering: initiate request two vpc's and accept it.
 */

resource "aws_vpc_peering_connection" "primary2utility" {
  count = "${var.create ? 1 : 0 }"

  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
  peer_vpc_id = "${data.aws_vpc.utility_vpc.id}"  
  vpc_id = "${data.aws_vpc.primary_vpc.id}"
  // aws requires to accept a peering connection after creation.
  auto_accept = true

  tags {
    Name        = "${var.namespace}-${var.environment}"
    Namespace   = "${var.namespace}"
    Environment = "${var.environment}"
    Region      = "${var.region}"
    Terraform   = "true"
  }
}
