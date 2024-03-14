#---------------------------------Security Group ----------------------------------#

QA_security_name                       = "QA-Frontend-sg"
QA_security_description                = "Security group for QA-Frontend-API"
QA_SG_vpc_id                           = "vpc-0383f4dc3af051efa"    #QA-VPC-ID
QA_inbound_ports                       = [
  { port                                = 22, protocol = "tcp", cidr_blocks = "10.0.1.0/24" },                     # Management VPC Cidr Block
  { port                                = 22, protocol = "tcp", security_group_ids = "sg-0f470a22a92136557" },     #  QA-Frontend-lb-sg ID
  { port                                = 3000, protocol = "tcp", security_group_ids = "sg-0b426399b2b19b0ae" },   # OpenVPN-SG
]
QA_outbound_ports                      = [
  { port                                = 0, protocol = "-1", cidr_blocks = "0.0.0.0/0" }
]
QA_Sg_tags                             = {
  Name                                  = "QA-Frontend-sg"
  Enviroment                            = "QA"
  Owner                                 = "Vishal"
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------Launch Template ----------------------------------#

QA_private_key_algorithm               = "RSA"
QA_private_key_rsa_bits                = 4096
QA_template_name                       = "QA-Frontend-template"
QA_template_description                = "Template for QA-Frontend"
QA_AMI_ID                              = "ami-0c335502f397b30c6"
QA_instance_type                       = "t2.micro"
QA_instance_keypair                    = "QA_Key"
QA_subnet_ID                           = "subnet-04c0c823118f48202"
QA_user_data_script_path               = "./script.sh"

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------- Target Group -----------------------------------#

QA_target_group_name                   = "QA-Frontend-TG"
QA_target_group_port                   = 3000
QA_target_group_protocol               = "HTTP"
QA_TG_vpc_id                           = "vpc-0383f4dc3af051efa"   #QA-VPC-ID
QA_health_check_path                   = "/health"
QA_health_check_port                   = "traffic-port"
QA_health_check_interval               = 30
QA_health_check_timeout                = 5
QA_health_check_healthy_threshold      = 2
QA_health_check_unhealthy_threshold    = 2

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#------------------------------- Listener rule of ALB -----------------------------#

QA_listener_arn                          = "arn:aws:elasticloadbalancing:ap-northeast-1:133673781875:listener/app/QA-ALB/28944ea6f074d63f/4f0525f30ddcc2a5"
QA_path_pattern                          = "*"
QA_action_type                           = "forward"
QA_priority                              = 100

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------Configure Auto Scaling group ---------------------------#

QA_autoscaling_group_name              = "QA_Frontend_ASG"
QA_min_size                            = 1
QA_max_size                            = 2
QA_desired_capacity                    = 1
QA_subnet_ids                          = ["subnet-04c0c823118f48202"]   #QA-Frontend Pvt ID
QA_tag_key                             = "Name"
QA_tag_value                           = "QA_Frontend_ASG"
QA_propagate_at_launch                 = true

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#---------------------------- Auto Scaling Policies -------------------------------#

QA_scaling_policy_name                 = "target-tracking-policy"
QA_policy_type                         = "TargetTrackingScaling"
QA_predefined_metric_type              = "ASGAverageCPUUtilization"
QA_target_value                        = 50.0

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
