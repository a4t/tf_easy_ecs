variable project_name {}

variable prefix_ip {
  default = "172.16"
}

variable availability_zone {
  default = [
    "ap-northeast-1a",
    "ap-northeast-1c",
  ]
}

variable developer_ips {
  default = []
}

variable aws_launch_configuration_machine {
  default = {
    image_id      = "ami-e4657283"
    instance_type = "t2.micro"
    key_name      = "your_key"
  }
}

variable aws_autoscaling_group_machine {
  default = {
    max_size = 0
    min_size = 0
  }
}
