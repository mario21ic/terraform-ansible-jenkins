provider "aws" {
    region        = "${var.region}"
}

resource "aws_instance" "ci_server" {
    ami                       = "ami-f173cc91"
    instance_type             = "${var.instance_type}"
    key_name                  = "${var.key_name}"
    vpc_security_group_ids    = ["${aws_security_group.ci_server_inbound_sg.id}"]

    tags {
        Name = "ci_server"
        Class = "ci_server"
    }
}

resource "aws_eip" "ci_server" {
    instance          = "${aws_instance.ci_server.id}"
}

resource "aws_security_group" "ci_server_inbound_sg" {
    name = "ci_server_inbound"
    description = "ci_server inbound and outbound"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

