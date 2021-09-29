<!-- PROJECT SHIELDS -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Twitter][twitter-shield]][twitter-url]

# terraform-learning

Installs:
1. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) (required//Terraform auth and commands)
2. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) (required//AWS auth and commands)
3. [Visual Studio Code](https://code.visualstudio.com/download) (optional//any IDE will do, will also allow CLI use internally)
4. [Consul](https://www.consul.io/docs/install) (required for Deeper Dive section)

Setup AWS CLI (after AWS CLI [addon] is installed--use commands in whatever CLI of choice:
1. `aws configure set region` [your_region_name]
2. `aws ec2 create-key-pair --key-name` [your_key_name]

Terraform (authentication) commands:
- `terraform login` ---- Will need an account. Locally saves credentials from remote host.
- `terraform logout` ---- Self-explanatory. Removes locally-stored credentials to remote host.

Once Terraform/AWS/all of that stuff is installed/setup, start running through the folders. 
Move to a working directory within the repo, via CLI of choice, and play around a bit.
**Make sure to destroy resources when done so you don't get charged $$$$$$!!** 

Terraform (main) commands:
1. `terraform init` ---- Terraform dependencies; prepares working directory for other commands.
  - `terraform validate` ---- Optional; check whether the configuration is valid.
2. `terraform plan` ---- Show changes required by the current configuration.
3. `terraform apply` ---- Create or update infrastructure.
4. `terraform destroy` ---- Destroy previously-created infrastructure.

Terraform (basic) commands:
- `terraform [command] -help` ---- Adding `-help` to any command will show some guidance.
- `terraform version` ---- Shows current terraform version, duh.
- `terraform fmt` ---- Formats .tf files to the Hashicorp 'lint' standard.
- `terraform providers` ---- Show the providers required for this configuration.
- `terraform show` ---- Current state or saved plan (after `terraform plan` is used).
- `terraform output` ---- Show output values from your root module.

Terraform (advanced) commands:
- `terraform import` ---- Associate existing infrastructure with a Terraform resource.
- `terraform refresh` ---- Update the state to match remote systems.
- `terraform taint` ---- Marks a resource as corrupted to be destroyed and then re-created.
- `terraform untaint` ---- Removes the previously 'tainted' state from a resource instance.
- `terraform console` ---- a really neat feature to try out some interactive expressions.
- `terraform graph` ---- Generate a Graphviz graph of the steps in an operation.
- `terraform workspace` ---- Specifically for workspace management.

---------------------------------------------------------------------------

[NOTE] Keep in mind that .tfvars files can contain sensitive data, such as passwords, private/secret keys, etc. The files provided in this repo are for **learning purposes only**. This should not be a practice done in live/production environments. Also, when making your own repos, make sure to uncomment/add `*.tfvars` in the .gitignore file.

[Optional-Needs-Linux/Apple-Env] Terraform Getting Started (Terraform basics and Terraform Cloud)
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


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
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
[linkedin-url]: https://www.linkedin.com/in/julian-edington/
[twitter-shield]: https://img.shields.io/twitter/follow/arcanicvoid?style=for-the-badge&logo=twitter&colorB=555
[twitter-url]: https://twitter.com/arcanicvoid
