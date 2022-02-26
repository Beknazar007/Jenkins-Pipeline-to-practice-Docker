provider "aws" {
  region = "us-west-2"

}

resource "aws_instance" "instance" {
    count = 2
    ami = "ami-0a200d3f40a2f6ca0"
    instance_type = "t2.micro"
    tags = {
      name = "Name"
      value = "Beki"
    }
  
}