### ANSIBLE ###
resource "aws_instance" "ansible" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = "terraform"
  security_groups = ["${aws_security_group.webserver_sg.id}"]
  tags = {
    Name = var.project
    OS = "ubuntu"
  }
  connection {
    type            = "ssh"
    user            = "ec2-user"
    private_key     = "${file("terraform.pem")}" # have .pem file ready
    host            = "${self.public_ip}"
  }
  # temp example, thinking of making a more modern ansible deployment later
  provisioner "remote-exec" {
    inline          = [
      "sudo amazon-linux-extras install ansible2 -y",
      "sudo apt install git -y",
      "git clone https://github.com/devops-school/ansible-hello-world-role /tmp/ans_ws",
      "ansible-playbook /tmp/ans_ws/site.yaml"
    ]
  }
}