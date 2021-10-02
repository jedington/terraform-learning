### LAUNCH CONFIG ###
resource "aws_launch_configuration" "my_first_lc" {
  image_id        = var.ami
  instance_type   = var.instance_type
  key_name        = "terraform"
  security_groups = ["${aws_security_group.webserver_sg.id}"]
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


### ELASTIC LOAD BALANCER ###
resource "aws_elb" "my_first_elb" {
  name               = "terraform-elb"
  availability_zones = var.avail_zones
  security_groups    = ["${aws_security_group.webserver_sg.id}"]
  listener {
    lb_port           = var.http_port
    lb_protocol       = "http"
    instance_port     = var.http_port
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.http_port}/"
  }
}

### AUTOSCALING GROUP ###
resource "aws_autoscaling_group" "my_first_asg" {
  launch_configuration = aws_launch_configuration.my_first_lc.id
  load_balancers       = ["${aws_elb.my_first_elb.name}"]
  availability_zones   = var.avail_zones
  min_size             = 2
  max_size             = 10
  desired_capacity     = 3
  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }
}

### POLICY ###
resource "aws_autoscaling_policy" "my_asg_policy" {
  name                   = "webservers_autoscale_policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.my_first_asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = "60"
  }
}