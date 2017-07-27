resource "aws_subnet" "public" {
  count             = "${length(var.availability_zone)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.prefix_ip}.${count.index + 1}.0/24"
  availability_zone = "${var.availability_zone[count.index]}"

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_subnet" "private-nat" {
  count             = "${length(var.availability_zone)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.prefix_ip}.${count.index + 11}.0/24"
  availability_zone = "${var.availability_zone[count.index]}"

  tags {
    Name = "${var.project_name}"
  }
}
