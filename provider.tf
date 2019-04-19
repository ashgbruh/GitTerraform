# Configure the AWS Provider
# Check the Terraform AWS documentation for reference

provider "aws" {
  
  region     = "eu-west-2"
}
resource "aws_vpc" "main" {
  cidr_block       = "190.160.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    Location = "London"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.main.id}" # interpolation (Attribute reference)
  cidr_block = "190.160.1.0/24"

  tags = {
    Name = "Subnet1"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-07dc734dc14746eab"
  instance_type = "t2.micro"
}






