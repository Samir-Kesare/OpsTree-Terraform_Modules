
variable "enable_green_env" {
  description = "Enable green environment"
  type        = bool
  default     = true
}

locals {
  traffic_dist_map = {
    blue = {
      blue  = 100
      green = 0
    }
    blue-90 = {
      blue  = 90
      green = 10
    }
    split = {
      blue  = 50
      green = 50
    }
    green-90 = {
      blue  = 10
      green = 90
    }
    green = {
      blue  = 0
      green = 100
    }
  }
}

variable "traffic_distribution" {
  description = "Levels of traffic distribution"
  type        = string
}

variable "alb_arn" {
  description = "Levels of traffic distribution"
  type        = string
}

variable "blue_tg_arn" {
  description = "Levels of traffic distribution"
  type        = string
}

#--------------------------------Launch Template ----------------------------------#
variable "frontend_ami_name" {
  type    = string
  # default = "frontend-app-v2"
}
# Key Generate

variable "private_key_algorithm" {
  description = "value"
  type        = string
  default     = "RSA"
}
variable "private_key_rsa_bits" {
  description = "value"
  type        = number
  default     = 4096
}

# Launch Template 

variable "template_name" {
  description = "Launch Template Name"
  type        = string
  default     = "Template"
}
variable "template_description" {
  description = "Launch Template Description"
  type        = string
  default     = "Template for XXXX"
}

variable "instance_type" {
  description = "Launch Template Instance Type"
  type        = string
  default     = "t2.micro"
}
variable "instance_keypair" {
  description = "Launch Template Instance Type keypair name"
  type        = string
  default     = "MasterKey"
}
variable "subnet_ID" {
  description = "Launch Template Subnet ID"
  type        = string
  default     = "subnet-04c0c823118f48202"
}
variable "user_data_script_path" {
  description = "Path to the user data script file"
  type        = string
  default     = "./script.sh"
}

variable "security_groups_id" {
  type = list(string)
}

#--------------------------------- Target Group -----------------------------------#

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "Target-Group"
}
variable "target_group_port" {
  description = "Port for the target group"
  type        = number
  default     = 80
}
variable "target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
  default     = "HTTP"
}
variable "TG_vpc_id" {
  description = "ID of the VPC"
  type        = string
  default     = "vpc-0383f4dc3af051efa"
}
variable "health_check_path" {
  description = "The destination for the health check request"
  type        = string
  default     = "/health"
}
variable "health_check_port" {
  description = "The port to use to connect with the target for health checking"
  type        = string
  default     = "traffic-port"
}
variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 30
}
variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
}
variable "health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
  default     = 2
}
variable "health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering a target unhealthy"
  type        = number
  default     = 2
}

#--------------------------Configure Auto Scaling group ---------------------------#

variable "autoscaling_group_name" {
  description = "The name of the Auto Scaling Group"
  type        = string
  default     = "ASG"
}
variable "ASG_version" {
  description = "select Version"
  type        = string
  default     = "$Latest"
}
variable "min_size" {
  description = "The minimum number of instances in the ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the ASG"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "The desired number of instances in the ASG"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "The list of subnet IDs where the instances will be launched"
  type        = list(string)
  default     = ["subnet-04c0c823118f48202"]
}

variable "tag_key" {
  description = "The key for the tag to be applied to the ASG and instances"
  type        = string
  default     = "Name"
}

variable "tag_value" {
  description = "The value for the tag to be applied to the ASG and instances"
  type        = string
  default     = "ASG"
}

variable "propagate_at_launch" {
  description = "Whether the tag should be propagated to instances launched by the ASG"
  type        = bool
  default     = true
}

#---------------------------- Auto Scaling Policies -------------------------------#

variable "scaling_policy_name" {
  description = "The name of the scaling policy"
  type        = string
  default     = "target-tracking-policy"
}
variable "policy_type" {
  description = "The type of adjustment to make"
  type        = string
  default     = "TargetTrackingScaling"
}
variable "predefined_metric_type" {
  description = "The predefined metric type for tracking"
  type        = string
  default     = "ASGAverageCPUUtilization"
}
variable "target_value" {
  description = "The target value for the predefined metric"
  type        = number
  default     = 50.0
}

variable "target_group_arn" {
  description = "existing target group arn if any"
  type        = string
  default     = null
}

#------------------------------- Listener rule of ALB -----------------------------#

variable "frontend_listener_arn" {
  type        = string
}

variable "listener_rule_priority" {
  type        = number
}

variable "path_pattern" {
  type        = string
}
