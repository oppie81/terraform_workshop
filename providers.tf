terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    aap = {
      source = "ansible/aap"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
    default_tags {
    tags = {
      ManagedBy = "HCP Terraform"
    }
  }
}

provider "aap" {
  host = "https://https://caap.fvz.ansible-labs.de/"

  # Token authentication is recommended
  token = "zFaqyV8ta7uxMOWgcdSZ6FyWIrDUl9" # Also supports AAP_TOKEN environment variable

  # Basic authentication is also supported, ignored if token is set
  username = "mark.oppelaar@hcs-company.com" # Also supports AAP_USERNAME environment variable
  password = "T3chXchang3N1" # Also supports AAP_PASSWORD environment variable
}
