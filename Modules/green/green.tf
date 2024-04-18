#-------------------------------- Data Block ----------------------------------#

data "aws_ami" "frontend_ami" {
  most_recent = true
  owners      = ["133673781875"]

  filter {
    name   = "name"
    values = [var.frontend_ami_name, ]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#--------------------------------Launch Template ----------------------------------#

# Generate Private Key
resource "tls_private_key" "private_key" {
  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}

# Generate SSH Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = var.instance_keypair
  public_key = tls_private_key.private_key.public_key_openssh
}

# Download Private Key in PEM Format
resource "local_file" "private_key" {
  content  = tls_private_key.private_key.private_key_pem
  filename = "${var.instance_keypair}.pem"
}

resource "aws_launch_template" "green_template" {
  name          = var.template_name
  description   = var.template_description
  image_id      = data.aws_ami.frontend_ami.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key_pair.key_name
  network_interfaces {
    security_groups = var.security_groups_id
    subnet_id       = var.subnet_ID
  }
  # user_data = base64encode(templatefile(var.user_data_script_path, { varibale_name = Value (Fatch in Resources) })) if you need any variable pass in User data
  user_data = filebase64(var.user_data_script_path)
  tags = {
    Name = var.template_name
  }
}

#--------------------------------- Target Group -----------------------------------#

resource "aws_lb_target_group" "green_tg" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.TG_vpc_id

  health_check {
    path                = var.health_check_path
    protocol            = var.target_group_protocol
    port                = var.health_check_port
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = {
    Name = var.target_group_name
  }
}

locals {
  final_target_group_arn = var.target_group_arn != null ? var.target_group_arn : aws_lb_target_group.green_tg.arn
}

#--------------------------Configure Auto Scaling group ---------------------------#

resource "aws_autoscaling_group" "green_ASG" {
  name = var.autoscaling_group_name
  launch_template {
    id      = aws_launch_template.green_template.id
    version = var.ASG_version
  }
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids
  target_group_arns = [
    local.final_target_group_arn
  ]

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 100
      instance_warmup        = 300
      max_healthy_percentage = 110
      skip_matching          = true
    }
    triggers = ["launch_template"]
  }

  tag {
    key                 = var.tag_key
    value               = var.tag_value
    propagate_at_launch = var.propagate_at_launch
  }
}

#---------------------------- Auto Scaling Policies -------------------------------#

resource "aws_autoscaling_policy" "green_ASG_Policy" {
  name                   = var.scaling_policy_name
  autoscaling_group_name = aws_autoscaling_group.green_ASG.name
  policy_type            = var.policy_type

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }

    target_value = var.target_value

  }
}

# Weighted Forward action

resource "aws_lb_listener_rule" "green_path_based_routing" {
  listener_arn = var.frontend_listener_arn
  priority     = var.listener_rule_priority
  action {
    type = "forward"
    forward {
      target_group {
        arn    = var.blue_tg_arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "blue", 100)
      }

      target_group {
        arn    = aws_lb_target_group.green_tg.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "green", 0)
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
  condition {
      path_pattern {
        values = [var.path_pattern]
      }
    }
}