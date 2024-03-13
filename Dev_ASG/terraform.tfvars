#---------------------------------Security Group ----------------------------------#

Dev_security_name                       = "Dev-Frontend-sg"
Dev_security_description                = "Security group for Dev-Frontend-API"
Dev_SG_vpc_id                           = "vpc-0383f4dc3af051efa"    #Dev-VPC-ID
Dev_inbound_ports                       = [
  { port                                = 22, protocol = "tcp", cidr_blocks = "20.0.0.0/28" },                     # Management VPC Cidr Block
  { port                                = 22, protocol = "tcp", security_group_ids = "sg-0f470a22a92136557" },     #  Dev-Frontend-lb-sg ID
  { port                                = 3000, protocol = "tcp", security_group_ids = "sg-0b426399b2b19b0ae" },   # OpenVPN-SG
]
Dev_outbound_ports                      = [
  { port                                = 0, protocol = "-1", cidr_blocks = "0.0.0.0/0" }
]
Dev_Sg_tags                             = {
  Name                                  = "Dev-Frontend-sg"
  Enviroment                            = "dev"
  Owner                                 = "Vishal"
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------Launch Template ----------------------------------#

Dev_private_key_algorithm               = "RSA"
Dev_private_key_rsa_bits                = 4096
Dev_template_name                       = "Dev-Frontend-template"
Dev_template_description                = "Template for Dev-Frontend"
Dev_AMI_ID                              = "ami-0c335502f397b30c6"
Dev_instance_type                       = "t2.micro"
Dev_instance_keypair                    = "Dev_Key"
Dev_subnet_ID                           = "subnet-04c0c823118f48202"
Dev_user_data_script_path               = "./script.sh"

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------- Target Group -----------------------------------#

Dev_target_group_name                   = "Dev-Frontend-TG"
Dev_target_group_port                   = 3000
Dev_target_group_protocol               = "HTTP"
Dev_TG_vpc_id                           = "vpc-0383f4dc3af051efa"   #Dev-VPC-ID
Dev_health_check_path                   = "/health"
Dev_health_check_port                   = "traffic-port"
Dev_health_check_interval               = 30
Dev_health_check_timeout                = 5
Dev_health_check_healthy_threshold      = 2
Dev_health_check_unhealthy_threshold    = 2

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#------------------------------- Listener rule of ALB -----------------------------#

Dev_listener_arn                          = "arn:aws:elasticloadbalancing:ap-northeast-1:133673781875:listener/app/Dev-ALB/75bc9b1a35dbe964/761653fb399a30be"
Dev_path_pattern                          = "*"
Dev_action_type                           = "forward"
Dev_priority                              = 100

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------Configure Auto Scaling group ---------------------------#

Dev_autoscaling_group_name              = "Dev_Frontend_ASG"
Dev_min_size                            = 1
Dev_max_size                            = 2
Dev_desired_capacity                    = 1
Dev_subnet_ids                          = ["subnet-04c0c823118f48202"]   #Dev-Frontend Pvt ID
Dev_tag_key                             = "Name"
Dev_tag_value                           = "Dev_Frontend_ASG"
Dev_propagate_at_launch                 = true

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#---------------------------- Auto Scaling Policies -------------------------------#

Dev_scaling_policy_name                 = "target-tracking-policy"
Dev_policy_type                         = "TargetTrackingScaling"
Dev_predefined_metric_type              = "ASGAverageCPUUtilization"
Dev_target_value                        = 50.0

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#





