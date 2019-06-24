module "example" {
  source = "../../blueprints/peering"

  namespace   = "${local.namespace}"
  environment = "${local.environment}"
  region      = "${local.region}"

  create_peering = true

  primary_vpc_name = "app-dev"
  utility_vpc_name = "utils-dev"
}
