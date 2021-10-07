### LAUNCH INSTANCE ###
resource "aws_instance" "Webserver" {
  ami                     = var.ami["us-east-1"]
  count                   = 3 # multiple webservers
  instance_type           = var.instance_type
  key_name                = "terraform"
  #  `security_groups` is for EC2 Classic and Default VPCs only.
  #- security_groups      = ["${aws_security_group.webserver_sg.id}"]
  vpc_security_group_ids  = ["${aws_security_group.webserver_sg.id}"]
  tags = {
    Name  = "Webserver-${count.index + 1}"
    OS    = "Ubuntu"
  }
  user_data = <<EOF
  #!/bin/bash -xe
  exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
  /usr/bin/apt-get update
  DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
  /usr/bin/apt-get install apache2 -y
  /usr/sbin/ufw allow in "Apache Full"
  /bin/echo "Hello world " >/var/www/html/index.html
  instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
  echo $instance_ip >>/var/www/html/index.html
  EOF
} 