### ANSIBLE ###
resource "aws_instance" "ansible" {
  ami                     = ["${var.ami["us-east-1"]}"]
  instance_type           = var.instance_type
  key_name                = "terraform"
  #  `security_groups` is for EC2 Classic and Default VPCs only.
  #- security_groups      = ["${aws_security_group.webserver_sg.id}"]
  vpc_security_group_ids  = ["${aws_security_group.webserver_sg.id}"]
  tags = {
    Name  = var.project
    OS    = "Ubuntu"
  }
  # Temp example, thinking of making a more modern ansible deployment later.
  # Provisioners are a last resort, mostly why I would like to make my own... 
  # version of an ansible template, but we'll work with this temp one for now.
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install ansible2 -y",
      "sudo apt install git -y",
      "git clone https://github.com/devops-school/ansible-hello-world-role /tmp/ans_ws",
      "ansible-playbook /tmp/ans_ws/site.yaml"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("terraform.pem")}" # have .pem file ready
      host        = "${self.public_ip}"
    }
  }
}