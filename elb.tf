provider "aws" {
  region     = "ap-southeast-1"
}
##Test line
resource "aws_instance" "server" {
  ami           = "ami-fdb8229e"
  instance_type = "t2.micro"
}

EBS Attached using Terraform:

resource "aws_volume_attachment" "server" {
  device_name = "/dev/sdh"
  volume_id   = "vol-0c8c1f7c3c86d211b"
  instance_id = "i-0ba92aa2fc1959bee"
  volume_size = 5
  volume_type = "gp2"
}

resource "aws_instance" "web" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t1.micro"

  tags {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 1
}
