/**
 * 2. Create routes between vpc's
 */

data "aws_route_table" "primary_public" {
  tags = {
    Name = "${var.primary_route_public_name}"
  }
}

data "aws_route_table" "primary_private" {
  tags = {
    Name = "${var.primary_route_private_name}"
  }
}

data "aws_route_table" "utility_public" {
  tags = {
    Name = "${var.utility_route_public_name}"
  }
}

data "aws_route_table" "utility_private" {
  tags = {
    Name = "${var.utility_route_private_name}"
  }
}


resource "aws_route" "primary_public_peer" {
  count = "${var.create ? 1 : 0 }"

  route_table_id = "${data.aws_route_table.primary_public.route_table_id}"
  destination_cidr_block = "${data.aws_vpc.utility_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.primary2utility.id}"
}

resource "aws_route" "primary_private_peer" {
  count = "${var.create ? 1 : 0 }"

  route_table_id = "${data.aws_route_table.primary_private.route_table_id}"
  destination_cidr_block = "${data.aws_vpc.utility_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.primary2utility.id}"
}

resource "aws_route" "utility_public_peer" {
  count = "${var.create ? 1 : 0 }"

  route_table_id = "${data.aws_route_table.utility_public.route_table_id}"
  destination_cidr_block = "${data.aws_vpc.primary_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.primary2utility.id}"
}

resource "aws_route" "utility_private_peer" {
  count = "${var.create ? 1 : 0 }"

  route_table_id = "${data.aws_route_table.utility_private.route_table_id}"
  destination_cidr_block = "${data.aws_vpc.primary_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.primary2utility.id}"
}
