resource "aws_launch_configuration" "my_first_lc" {
    image_id        = "${var.ami}"
    instance_type   = "${var.instance_type}"
    key_name        = "terraform"
    security_groups = [ "${aws_security_group.webserver_sg.id}" ]
    name            = "webserver-launch"
    user_data       = <<EOF
        #!/bin/bash -xe
        exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
        /usr/bin/apt-get update
        DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
        /usr/bin/apt-get install apache2 -y
        /usr/sbin/ufw allow in "Apache Full"
        /bin/echo "Hello world " >/var/www/html/index.html
    EOF
}