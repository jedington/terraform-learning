output "public_ip" {
  value = ["${aws_instance.jenkins.public_ip}"]
}

# use this or self hosted option: https://github.com/mpolden/echoip
data "http" "my_public_ip" {
  url = "https://ifconfig.co/json"
  request_headers = {
    Accept = "application/json"
  }
}
locals {
  ifconfig_co_json = jsondecode(data.http.my_public_ip.body)
}
output "my_ip_addr" {
  value = local.ifconfig_co_json.ip
}