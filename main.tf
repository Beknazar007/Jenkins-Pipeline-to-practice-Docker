provider "aws" {
  region = "us-west-2"
  access_key = "AKIAUQDIWPF73FW4FHOX"
  secret_key = "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"
}


data "aws_ami" "AMI_Amazon" {
  owners = [ "amazon" ]
  most_recent = true
  filter {
    name="name"
    values=["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
}

resource "aws_instance" "instance" {
    count = 2
    ami = data.aws_ami.AMI_Amazon.id
    instance_type="t2.micro"
    tags = {
        Name = "TFC-DEV"
  }
 

}
resource "aws_security_group" "SG1" {


    name = "SG"
    description = "Allow TLS inbound traffic"
    tags ={
        Name = "SecurityGroupBeki"
    } 

    dynamic "ingress"{
      for_each=["80","443","22"]
      content{
        from_port   = ingress.value
        to_port     = ingress.value
        protocol    ="tcp"
        cidr_blocks =["0.0.0.0/0"]
      }
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}