terraform {
  /* cloud {
    organization = "RavLab"

    workspaces {
      name = "provisioners"
    }
  } */
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.70.0"
    }
  }
}