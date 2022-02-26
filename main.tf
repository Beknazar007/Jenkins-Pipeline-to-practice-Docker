provider "aws" {
  region = "us-west-2"
  access_key = "AKIAUQDIWPF73FW4FHOX"
  secret_key = "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"
}

resource "aws_instance" "instance" {
    count = 2
    ami = "ami-087c17d1fe0178315"
    instance_type = "t2.micro"
  
}