resource "aws_security_group" "webserver_sg" {
  description = "Allow  inbound traffic"
  ingress {
    description = "allow proxy to system"
    from_port   = var.proxy_port
    to_port     = var.proxy_port
    protocol    = "tcp"
    cidr_blocks = ["${local.ifconfig_co_json.ip}/32"]
    #  # alt option - hard coded local system
    #- cidr_blocks = ["${var.my_system}"]
  }
  ingress {
    description = "allow http to system"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["${local.ifconfig_co_json.ip}/32"]
    #  # alt option - hard coded local system
    #- cidr_blocks = ["${var.my_system}"]
  }
  ingress {
    description = "allow ssh to system"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["${local.ifconfig_co_json.ip}/32"]
    #  # alt option - hard coded local system
    #- cidr_blocks = ["${var.my_system}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}