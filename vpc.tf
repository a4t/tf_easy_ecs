resource "aws_vpc" "vpc" {
  cidr_block = "${var.prefix_ip}.0.0/16"

  tags {
    Name = "${var.project_name}"
  }
}
