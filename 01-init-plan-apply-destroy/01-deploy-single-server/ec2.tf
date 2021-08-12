resource "aws_instance" "Hello-World" {
    ami             = "ami-0a313d6098716f372"
    instance_type   = "t2.micro"
    key_name        = "terraform"
    tags            = {
        Name = "Hello-World"
    }
}