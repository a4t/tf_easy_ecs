output vpc_id {
  value = "${aws_vpc.vpc.id}"
}

output subnet_publics {
  value = "${aws_subnet.public.*.id}"
}

output subnet_private-nats {
  value = "${aws_subnet.private-nat.*.id}"
}

output ecs_cluster_id {
  value = "${aws_ecs_cluster.ecs.id}"
}

output ecs_cluster_name {
  value = "${aws_ecs_cluster.ecs.name}"
}

output security_group_app_id {
  value = "${aws_security_group.app.id}"
}
