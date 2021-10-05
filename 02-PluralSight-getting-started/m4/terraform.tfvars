# IAM Access and Secret Key for your IAM user
aws_access_key = ""

aws_secret_key = ""

# Name of the key pair in AWS, MUST be in same region as EC2 instance
# AWS CLI commands to create a key pair:
# aws configure set region your_region_name
# aws ec2 create-key-pair --key-name your_key_name
key_name = "terraform"

# Local path to pem file for key pair. 
# Windows paths need to use double-backslash: Ex. C:\\Users\\Ned\\Pluralsight.pem
private_key_path = "~\\.terraform\\terraform.pem"