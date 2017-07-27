resource "aws_iam_role" "ec2" {
  name = "${var.project_name}-ecs-ec2"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ecs-ec2" {
  name = "${var.project_name}-ecs-ec2-profile"
  path = "/"
  role = "${aws_iam_role.ec2.name}"
}

resource "aws_iam_role_policy" "ecs" {
  name = "ecs"
  role = "${aws_iam_role.ec2.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecs:StartTask"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
