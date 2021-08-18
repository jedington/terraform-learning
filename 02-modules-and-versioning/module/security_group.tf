resource "aws_security_group" "webserver_sg" {
  name = "webserver_sg-${var.environment}"
}

# Keep in mind that remote access to virtual machine(s) is only
# ...viable from the host that used terraform to bring them up.
resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  security_group_id = aws_security_group.webserver_sg.id
  from_port         = var.http_port
  to_port           = var.http_port
  protocol          = "tcp"
  cidr_blocks = ["${local.ifconfig_co_json.ip}/32"]
  #  # alt option - hard coded local system
  #- cidr_blocks = ["${var.my_system}"]
}
resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.webserver_sg.id
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  protocol          = "tcp"
  cidr_blocks = ["${local.ifconfig_co_json.ip}/32"]
  #  # alt option - hard coded local system
  #- cidr_blocks = ["${var.my_system}"]
}
resource "aws_security_group_rule" "allow_outgoing" {
  type              = "egress"
  security_group_id = aws_security_group.webserver_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
