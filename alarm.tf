resource "aws_cloudwatch_metric_alarm" "machine_cluster_cpu_util_high" {
  alarm_name          = "${var.project_name}_machine_cluster_cpu_util_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"

  dimensions {
    ClusterName = "${aws_ecs_cluster.ecs.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "machine_cluster_cpu_util_low" {
  alarm_name          = "${var.project_name}_machine_cluster_cpu_util_low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = "20"

  dimensions {
    ClusterName = "${aws_ecs_cluster.ecs.name}"
  }
}
