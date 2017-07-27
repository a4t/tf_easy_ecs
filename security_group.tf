resource "aws_security_group" "developer" {
  name   = "${var.project_name}-developer"
  vpc_id = "${aws_vpc.vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.developer_ips}"]
  }
}

resource "aws_security_group" "app" {
  name   = "${var.project_name}-app"
  vpc_id = "${aws_vpc.vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 32768
    to_port     = 61000
    protocol    = "tcp"
    cidr_blocks = ["${var.prefix_ip}.0.0/16"]
  }
}
