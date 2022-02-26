provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "server" {
  count = 1 # create four similar EC2 instances

  ami           = "ami-038b3df3312ddf25d"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

  
 