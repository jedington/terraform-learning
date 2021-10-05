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

# Prefix value to be used for S3 bucket. You can leave this value as-is
bucket_name_prefix = "globo"

# Environment tag for all resources being created. You can leave this value as-is.
environment_tag = "dev"

# Made up billing code to be added as a tag to resources. You can leave this value as-is.
billing_code_tag = "ACCT8675309"

# You will need to create a service principal
# Check the README for instructions
arm_subscription_id = "AZURE_SUBSCRIPTION_ID"

# This will be the appId from the service principal creation
arm_principal = "AZURE_SERVICE_PRINCIPAL_ID"

arm_password = "AZURE_SERVICE_PRINCIPAL_PASSWORD"

tenant_id = "AZURE_SERVICE_PRINCIPAL_TENANT_ID"

dns_zone_name = "yourdomain.com"

dns_resource_group = "azure_resource_group_for_dns"

network_address_space = {
  Development = "10.0.0.0/16"
  UAT = "10.1.0.0/16"
  Production = "10.2.0.0/16"
}

instance_size = {
  Development = "t2.micro"
  UAT = "t2.small"
  Production = "t2.medium"
}

subnet_count = {
  Development = 2
  UAT = 2
  Production = 3
}

instance_count = {
  Development = 2
  UAT = 4
  Production = 6
}
