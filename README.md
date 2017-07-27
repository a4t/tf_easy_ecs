# tf_easy_ecs

AWS環境に簡易版ECSの土台を作るTerraformスクリプト

## 作成されるもの

### ネットワーク系
- aws_vpc
- aws_subnet
  - private-nat * AZ数
  - public * AZ数
- aws_route_table
- aws_internet_gateway
- aws_security_group
  - developer用
  - アプリ用

### スケール系
- aws_launch_configuration
- aws_autoscaling_group
- aws_autoscaling_policy
  - scale_in
  - scale_out
- aws_cloudwatch_metric_alarm
  - cluster_cpu_util_high
  - cluster_cpu_util_low

### ECS系
- aws_ecs_cluster
- aws_iam_role
- aws_iam_role_policy
- aws_iam_instance_profile
  - EC2のインスタンス用

## using module

```
module easy_ecs {
  source = "github.com/a4t/tf_easy_ecs"

  project_name = "your_project"

  developer_ips = [
    "192.168.11.1/32",
    "192.168.11.2/32"
  ]

  aws_launch_configuration_machine = {
    image_id      = "ami-e4657283"
    instance_type = "t2.micro"
    key_name      = "your_key"
  }

  aws_autoscaling_group_machine = {
    max_size = 1
    min_size = 1
  }
}
```
