resource "aws_autoscaling_policy" "scale_out_high" {
  name                   = "ScaleOut-CPU-High"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.machine.name}"
}

resource "aws_autoscaling_policy" "scale_in_low" {
  name                   = "ScaleIn-CPU-Low"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.machine.name}"
}
