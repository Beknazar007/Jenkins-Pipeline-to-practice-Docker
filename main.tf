provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "server" {
  count = 1 # create four similar EC2 instances

  ami           = "ami-033b95fb8079dc481"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

  
 