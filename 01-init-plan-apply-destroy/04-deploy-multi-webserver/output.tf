output "public_ip" {
  value = ["${aws_instance.Webserver.*.public_ip}"]
}