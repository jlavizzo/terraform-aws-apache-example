variable "vpc_id" {
    type = string
  
}

variable "my_ip_with_cidr" {
  type = string
  description = "provide your ipv6 eg. 2603:8080:1105:419a:8deb:bd59:88d1:7960/128"
}

variable "public_key" {
  type = string
  description = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDyp3Zd3+3A0zJPqYoJi2zycnV1tUvHnzTMIQaEWd29E6YprZkM8xfsH1cb0O5mcNNcJNidL1SQUSkF9kyTjqLaiyjvQOyqMrbDElmW89tiR2JU3arCWTG8oibw7LzjoNvk/7Nw85EXy7KD7GXoLpZf+ExW1k0qBZTPgIUYfxrZ3EY1yuq3OWsxjkIeD6zna6+3R9RYYgHMxsSNUqMQz4TPtFFczmw7X8bbERhbLjIqGqqkKO0XRL5N9MZMiJvXsBp9fFSIQPl7H8K6xtxje6EewPLfnFEZqoUYvKCNwVMTIvpI4f/e2uNrXOzn6RbXk5eOmgmgEGFFDlDMVMS1VHBscKtXt96Ic94v6F0lU77OfUc8vG5ocSgNjSVSWEkETgoYy204H9w4JAIw/ntxS7WY7mhTt+ONVQBUdFEyu/bahk+33dIqF5SVHcLr+qauxEOGn+Jq4mJvOK6SNtoywE1zV1RFq4GS39xB9F4VbeDjAzvbnLeok7wMJvB+gdjlxH8= jlavizzo@josephs-MBP.lan"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "server_name" {
  type = string
  default = "Apache TerraServer"
}