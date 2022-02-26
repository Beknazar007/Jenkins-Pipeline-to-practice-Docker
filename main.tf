provider "aws" {
  region = "us-west-2"

}

resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-038b3df3312ddf25d"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

  
 