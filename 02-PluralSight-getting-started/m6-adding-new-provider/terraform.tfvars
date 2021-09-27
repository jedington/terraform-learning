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
private_key_path = "C:\\Users\\%userprofile%\\.terraform\\terraform.pem"

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

dns_zone_name =  "yourzonename.com"

dns_resource_group = "AZURE_RESOURCE_GROUP_NAME_FOR_DNS_ZONE"