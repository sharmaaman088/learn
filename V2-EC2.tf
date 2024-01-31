provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "demo-server" {
    ami           = "ami-0e9107ed11be76fde"
    instance_type = "t2.micro"
    key_name      = "dppi"
}

resource "aws_security_group" "demo-sg" {
    name        = "demo-sg"
    description = "SSH ACCESS"

    ingress {
        description = "Ssh access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}
