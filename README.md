<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<img src="https://readme-typing-svg.herokuapp.com?lines=Terraform%20Learning&size=30" alt="Terraform Learning" /> 

## Pre-reqs
1. [Visual Studio Code-Install](https://code.visualstudio.com/download) (Optional//any decent editor will do)
2. [Git-Install](https://git-scm.com/downloads) (Required//should already have this anyways)
3. [Terraform Account-Create](https://learn.hashicorp.com/tutorials/terraform/cloud-sign-up?in=terraform/cloud-get-started) (Optional//for Terraform Cloud/auth/remote backend option)
4. [Terraform CLI-Install](https://learn.hashicorp.com/tutorials/terraform/install-cli) (Required//Terraform auth and commands)
5. [AWS Account-Create](https://portal.aws.amazon.com/billing/signup) (Required//in order to use AWS resources)
6. [AWS CLI-Install](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) (Required//AWS auth and commands)
7. Setup AWS CLI (after AWS CLI is installed)--use commands in whatever CLI of choice:
    - [NOTE] See [CLI-configure-files](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) on  how to setup AWS authentication.
    1. `aws configure set region` [your_region_name]
    2. `aws ec2 create-key-pair --key-name` [your_key_name]
8. [Consul-Install](https://www.consul.io/docs/install) (Required//for Deeper Dive section)
9. Clone repo to your local env: 
    - [Run] `git clone https://github.com/jedington/terraform-learning.git ~/terraform-learning`

Once Terraform/AWS/all of that stuff is installed/setup, start running through the folders. 
Move to a working directory within the repo, via CLI of choice, and play around a bit.
**Make sure to destroy resources when done so you don't get charged $$$$$$!!** 

## Terraform (main) commands
1. `terraform init` ---- Terraform dependencies; prepares working directory for other commands.
    - `terraform validate` ---- Optional; check whether the configuration is valid.
2. `terraform plan` ---- Show changes required by the current configuration.
3. `terraform apply` ---- Create or update infrastructure.
4. `terraform destroy` ---- Destroy previously-created infrastructure.

Terraform (authentication) commands; see [this link](https://www.terraform.io/docs/cli/commands/login.html) for information/usage:
- `terraform login` ---- Will need an account. Locally saves credentials from remote host.
- `terraform logout` ---- Self-explanatory. Removes locally-stored credentials to remote host.

## Terraform (basic) commands
- `terraform [command] -help` ---- Adding `-help` to any command will show some guidance.
- `terraform version` ---- Shows current terraform version, duh.
- `terraform fmt` ---- Formats .tf files to the Hashicorp 'lint' standard.
- `terraform providers` ---- Show the providers required for this configuration.
- `terraform show` ---- Current state or saved plan (after `terraform plan` is used).
- `terraform output` ---- Show output values from your root module.

## Terraform (advanced) commands
- `terraform import` ---- Associate existing infrastructure with a Terraform resource.
- `terraform refresh` ---- Update the state to match remote systems.
- `terraform taint` ---- Marks a resource as corrupted to be destroyed and then re-created.
- `terraform untaint` ---- Removes the previously 'tainted' state from a resource instance.
- `terraform console` ---- a really neat feature to try out some interactive expressions.
- `terraform graph` ---- Generate a Graphviz graph of the steps in an operation.
- `terraform workspace` ---- Specifically for workspace management.

---------------------------------------------------------------------------

[NOTE] Keep in mind that .tfvars files can contain sensitive data, such as passwords, private/secret keys, etc. The files provided in this repo are for **learning purposes only**. This should not be a practice done in live/production environments. Also, when making your own repos, make sure to uncomment/add `*.tfvars` in the .gitignore file.

## PluralSight Sources by [ned1313](https://github.com/ned1313)
1. [PluralSight Getting Started Terraform](https://github.com/ned1313/Getting-Started-Terraform) For...
  * This Repo's: [02-PluralSight-getting-started](https://github.com/jedington/terraform-learning/tree/master/02-PluralSight-getting-started)
2. [PluralSight Deep Dive Terraform](https://github.com/ned1313/Deep-Dive-Terraform) For...
  * This Repo's: [03-PluralSight-deeper-dive](https://github.com/jedington/terraform-learning/tree/master/03-PluralSight-deeper-dive)
3. [PluralSight AWS Terraform](https://github.com/ned1313/Implementing-Terraform-on-AWS) For...
  * This Repo's: [04-PluralSight-AWS-Cloud](https://github.com/jedington/terraform-learning/tree/master/04-PluralSight-AWS-Cloud)
4. [PluralSight Azure Terraform](https://github.com/ned1313/Implementing-Terraform-on-Microsoft-Azure) For...
  * This Repo's: [05-PluralSight-Azure-Cloud](https://github.com/jedington/terraform-learning/tree/master/05-PluralSight-Azure-Cloud)

## Hashicorp Source (bonus)
[Linux/MacOS] (Terraform fake/test config, and learning Terraform Cloud)
  * `git clone https://github.com/hashicorp/tfc-getting-started.git ~/tfc-getting-started`

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/jedington/terraform-learning.svg?style=for-the-badge
[contributors-url]: https://github.com/jedington/terraform-learning/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jedington/terraform-learning.svg?style=for-the-badge
[forks-url]: https://github.com/jedington/terraform-learning/network/members
[stars-shield]: https://img.shields.io/github/stars/jedington/terraform-learning.svg?style=for-the-badge
[stars-url]: https://github.com/jedington/terraform-learning/stargazers
[issues-shield]: https://img.shields.io/github/issues/jedington/terraform-learning.svg?style=for-the-badge
[issues-url]: https://github.com/jedington/terraform-learning/issues
[license-shield]: https://img.shields.io/github/license/jedington/terraform-learning.svg?style=for-the-badge
[license-url]: https://github.com/jedington/terraform-learning/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/julian-edington