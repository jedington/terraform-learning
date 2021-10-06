### JENKINS ###
resource "aws_instance" "jenkins" {
  ami                     = var.ami["us-east-1"]
  instance_type           = var.instance_type
  key_name                = "terraform"
  #- security_groups      = ["${aws_security_group.webserver_sg.id}"]
  vpc_security_group_ids  = ["${aws_security_group.webserver_sg.id}"]
  iam_instance_profile    = "${aws_iam_instance_profile.ec2_profile.name}"
  tags = {
    Name  = var.project
    OS    = "Ubuntu"
  }
  user_data = <<EOC
  #!/bin/bash -xe
  exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
  /usr/bin/wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
  /bin/sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  /usr/bin/apt-get update
  DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
  /usr/bin/apt-get install default-jdk -y
  /usr/bin/apt-get install jenkins -y
  /bin/systemctl start jenkins
  /bin/systemctl status jenkins
  /usr/sbin/ufw allow 8080
  /usr/sbin/ufw status
  /usr/bin/apt install python3-pip -y
  pip3 install awscli
  apt install unzip
  wget -q https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip
  unzip terraform_0.15.5_linux_amd64.zip
  mv terraform /usr/local/bin/terraform
  terraform version
  echo "#########   all commands executed successfuly !! ########## "
  EOC
}

### ROLE ###
resource "aws_iam_role" "ec2_role" {
  name = "jenkins-ec2_role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF

  tags = {
    Name = "ec2-role"
  }
}
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = "${aws_iam_role.ec2_role.name}"
}

### POLICY ###
resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  path        = "/"
  description = "s3 policy for Instance "

  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": [
          "ec2:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": [
          "route53:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}
resource "aws_iam_role_policy_attachment" "s3-pol-attach" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${aws_iam_policy.s3_policy.arn}"
}