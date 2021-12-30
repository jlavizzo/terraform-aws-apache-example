terraform module to provision an EC2 instance that is running Pachae

not intended for productin use. Just showcasing how to create a custom module on Terraform Registry

```hcl
terraform {

}

provider "aws" {
  region = "us-east-1"
}

module "apache" {
  source          = ".//terraform-aws-apache-example"
  vpc_id          = "vpc-0000"
  my_ip_with_cidr = "MY_OWN_IP/32"
  public_key      = "ssh-rsa AAAAB.."
  instance_type   = "t2.micro"
  server_name     = "Apache TerraServer"
}

output "public_ip" {
  value = module.apache.public_ip
}

```