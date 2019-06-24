/**
 * 3. Security Groups: Allow traffic between vpc's
 *
 * Since the vpc's are inside the same region we can refer to a security group id created in another vpc.
 */

data "aws_security_group" "primary_sg" {
  tags = {
    Name = "${var.primary_sg_name}"
  }
}

data "aws_security_group" "utility_sg" {
  tags = {
    Name = "${var.utility_sg_name}"
  }
}

resource "aws_security_group_rule" "primary_peering_sg" {
  count = "${var.create ? 1 : 0 }"

  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  depends_on        = ["aws_vpc_peering_connection.primary2utility"]

  security_group_id = "${data.aws_security_group.primary_sg.id}"
  source_security_group_id = "${data.aws_security_group.utility_sg.id}"

  description       = "Allow pods to communicate via vpc peering."
}

resource "aws_security_group_rule" "utility_peering_sg" {
  count = "${var.create ? 1 : 0 }"
  
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  depends_on        = ["aws_vpc_peering_connection.primary2utility"]
  
  security_group_id = "${data.aws_security_group.utility_sg.id}"
  source_security_group_id = "${data.aws_security_group.primary_sg.id}"
  
  description       = "Allow pods to communicate via vpc peering."
}
