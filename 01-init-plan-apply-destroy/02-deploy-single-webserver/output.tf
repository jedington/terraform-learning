output "DNS_name_elb" {
  value = ["${aws_elb.my_first_elb.dns_name}"]
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