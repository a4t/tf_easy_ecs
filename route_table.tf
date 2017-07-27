resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc.id}"
  }

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_route_table" "private-nat" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc.id}"
  }

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.availability_zone)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private-nat" {
  count          = "${length(var.availability_zone)}"
  subnet_id      = "${element(aws_subnet.private-nat.*.id, count.index)}"
  route_table_id = "${aws_route_table.private-nat.id}"
}
