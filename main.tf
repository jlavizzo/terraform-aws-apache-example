# retrieving vpc
data "aws_vpc" "main" {
  id = var.vpc_id
}

# retrieving the subnet ids for a specfic vpc
data "aws_subnet_ids" "my_subnet_ids" {
  vpc_id = var.vpc_id
}

# retrieving user data file
data "template_file" "user_data" {
  template = file("${abspath(path.module)}/userdata.yaml")
}

# retrieving ami
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# KEY PAIR
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
}

# SECURITY GROUP
resource "aws_security_group" "sg_terraserver" {
  name        = "sg_terraserver"
  description = "my security group for terraserver"
  vpc_id      = data.aws_vpc.main.id

  ingress = [
    {
      description      = "HTTP access"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "SSH access"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = [var.my_ip_with_cidr]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

}

# EC2 INSTANCE
resource "aws_instance" "my_terraserver" {
  ami                    = data.aws_ami.amazon-linux-2.id # "ami-0ed9277fb7eb570c9"
  subnet_id              = tolist(data.aws_subnet_ids.my_subnet_ids.ids)[0]
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg_terraserver.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = var.server_name
  }
}

