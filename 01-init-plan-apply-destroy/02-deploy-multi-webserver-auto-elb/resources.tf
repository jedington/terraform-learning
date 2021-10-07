### LAUNCH INSTANCE ###
resource "aws_launch_configuration" "my_first_lc" {
  ami                     = var.ami["us-east-1"]
  instance_type           = var.instance_type
  key_name                = "terraform"
  #  `security_groups` is for EC2 Classic and Default VPCs only.
  #- security_groups      = ["${aws_security_group.webserver_sg.id}"]
  vpc_security_group_ids  = ["${aws_security_group.webserver_sg.id}"]
  name                    = "Webserver-ELB"
  user_data               = <<EOF
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


### ELASTIC LOAD BALANCER ###
resource "aws_elb" "my_first_elb" {
  name                    = "Terraform-ELB"
  availability_zones      = var.avail_zones
  #  `security_groups` is for EC2 Classic and Default VPCs only.
  #- security_groups      = ["${aws_security_group.webserver_sg.id}"]
  vpc_security_group_ids  = ["${aws_security_group.webserver_sg.id}"]
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