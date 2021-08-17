variable "region" {
  default = "us-east-1"
}
variable "http_port" {
  default = 80
}
variable "ssh_port" {
  default = 22
}
#- variable "my_system" {
#-     default = "{your ip goes here}/32"
#- }
variable "ami" {
  default = "ami-0a313d6098716f372" # us-east-1 / North Virginia, Ubuntu AWS EC2
  #- default = "ami-05c1fa8df71875112" # us-east-2 / Ohio, Ubuntu AWS EC2
  #- default = "ami-08fd8ae3806f09a08" # us-west-1 / California, Ubuntu AWS EC2
}
variable "instance_type" {
  default = "t2.micro"
}
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}