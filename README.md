# terraform-learning

Installs:
1. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) (required//Terraform auth and commands)
2. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) (required//AWS auth and commands)
3. [Visual Studio Code](https://code.visualstudio.com/download) (optional//any IDE will do, will also allow CLI use internally)
4. [Consul](https://www.consul.io/docs/install) (required for Deeper Dive section)

Setup AWS CLI (after AWS CLI is installed--use commands w/in native CLI, Git Bash, or IDE internally provided CLI):
1. aws configure set region [your_region_name]
2. aws ec2 create-key-pair --key-name [your_key_name]

[Optional] Terraform Getting Started (Terraform basics and Terraform Cloud)
- git clone https://github.com/hashicorp/tfc-getting-started.git

ref 1 - https://github.com/cloudiac18/ultimate-terraform-course-for-devops
For...
  * https://github.com/jedington/terraform-learning/tree/master/01-init-plan-apply-destroy

ref 2 - https://github.com/ned1313/Getting-Started-Terraform
For...
  * https://github.com/jedington/terraform-learning/tree/master/02-PluralSight-getting-started

ref 3 - https://github.com/ned1313/Deep-Dive-Terraform
For...
  * https://github.com/jedington/terraform-learning/tree/master/03-PluralSight-deeper-dive
