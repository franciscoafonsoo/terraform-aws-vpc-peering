output "primary_vpc_name" {
  value = "${var.primary_vpc_name}"
}

output "utility_vpc_name" {
  value = "${var.utility_vpc_name}"
}

output "primary_vpc_id" {
  value = "${data.aws_vpc.primary_vpc.id}"
}

output "primary_cidr_block" {
  value = "${data.aws_vpc.primary_vpc.cidr_block}"
}

output "primary_sg_id" {
  value = "${data.aws_security_group.primary_sg.id}"
}

output "utility_vpc_id" {
  value = "${data.aws_vpc.utility_vpc.id}"
}

output "utility_cidr_block" {
  value = "${data.aws_vpc.utility_vpc.cidr_block}"
}

output "utility_sg_id" {
  value = "${data.aws_security_group.utility_sg.id}"
}
