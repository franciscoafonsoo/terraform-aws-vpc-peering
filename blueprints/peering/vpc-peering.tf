module "peering" {
  source = "../../modules/vpc-peering"

  namespace          = "${var.namespace}"
  environment        = "${var.environment}"
  region             = "${var.region}"

  create             = "${var.create_peering}" 

  primary_vpc_name   = "${var.primary_vpc_name}"
  utility_vpc_name   = "${var.utility_vpc_name}"

  primary_sg_name    = "${var.primary_vpc_name}-${var.suffix_sg}"
  utility_sg_name    = "${var.utility_vpc_name}-${var.suffix_sg}"

  primary_route_public_name   = "${var.primary_vpc_name}-${var.suffix_route_public}"
  primary_route_private_name  = "${var.primary_vpc_name}-${var.suffix_route_private}"

  utility_route_public_name   = "${var.utility_vpc_name}-${var.suffix_route_public}"
  utility_route_private_name  = "${var.utility_vpc_name}-${var.suffix_route_private}"

}
