provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "server_1" {
    ami = "value"
    instance_type = "value"
     key_name = "value"
     tags = {
       "name" = "ec2_instance"
     }
} 

resource "aws_vpc" "my_vpc" {
    cidr_block = ""
    
}