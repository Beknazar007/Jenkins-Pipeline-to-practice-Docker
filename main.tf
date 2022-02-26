provider "aws" {
  region = "us-west-2"

}

resource "aws_instance" "instance" {
    count = 2
    ami = "ami-033b95fb8079dc481"
    
  
}