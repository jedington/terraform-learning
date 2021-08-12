resource "aws_autoscaling_group" "my_first_asg" {
    launch_configuration    = "${aws_launch_configuration.my_first_lc.id}"
    load_balancers          = [ "${aws_elb.my_first_elb.name}" ]
    availability_zones      = "${var.availability_zones}"
    min_size                = 2
    max_size                = 10
    desired_capacity        = 3
    tag {
        key                 = "Name"
        value               = "terraform-asg"
        propagate_at_launch = true
    }
}