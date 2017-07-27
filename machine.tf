resource "aws_launch_configuration" "machine" {
  name                        = "${var.project_name}"
  image_id                    = "${var.aws_launch_configuration_machine["image_id"]}"
  instance_type               = "${var.aws_launch_configuration_machine["instance_type"]}"
  key_name                    = "${var.aws_launch_configuration_machine["key_name"]}"
  security_groups             = ["${aws_security_group.developer.id}", "${aws_security_group.app.id}"]
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.ecs-ec2.id}"
  user_data                   = "#!/bin/bash\necho ECS_CLUSTER=kokoro-odoru > /etc/ecs/ecs.config"
}

resource "aws_autoscaling_group" "machine" {
  name                 = "${var.project_name}"
  max_size             = "${var.aws_autoscaling_group_machine["max_size"]}"
  min_size             = "${var.aws_autoscaling_group_machine["min_size"]}"
  launch_configuration = "${aws_launch_configuration.machine.name}"
  vpc_zone_identifier  = ["${aws_subnet.private-nat.*.id}"]

  tags = [
    {
      key                 = "Name"
      value               = "ecs-${var.project_name}"
      propagate_at_launch = true
    },
  ]
}
