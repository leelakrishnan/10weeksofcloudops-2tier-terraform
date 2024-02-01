2 tier Application throgh terraform

Architecture:
![Alt text](<archeitecture.png>)

After cloning the repo:

cd game_store_app

terraform init: This command initializes a Terraform working directory by preparing the necessary environment. It downloads the required providers and modules to manage the infrastructure specified in the configuration files.

terraform plan: This command creates an execution plan, which Terraform uses to show you what actions it will take to change the infrastructure from its current state to the state defined in your configuration files. It's a way to preview changes without applying them, ensuring you understand what will happen when you proceed.

terraform apply: This command applies the changes required to reach the desired state of the infrastructure as defined in your configuration files. It will execute the actions proposed i