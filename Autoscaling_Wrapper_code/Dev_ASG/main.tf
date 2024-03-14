module "Dev_ASG" {
source                              = "git::https://github.com/CodeOps-Hub/Terraform-modules/tree/main/Auto_Sacling_Module"
#---------------------------------Security Group ----------------------------------#
security_name                       = var.Dev_security_name
Security_description                = var.Dev_security_description
SG_vpc_id                           = var.Dev_SG_vpc_id
inbound_ports                       = var.Dev_inbound_ports
outbound_ports                      = var.Dev_outbound_ports
Sg_tags                             = var.Dev_Sg_tags
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------Launch Template ----------------------------------
private_key_algorithm               = var.Dev_private_key_algorithm
private_key_rsa_bits                = var.Dev_private_key_rsa_bits
template_name                       = var.Dev_template_name
template_description                = var.Dev_template_description
AMI_ID                              = var.Dev_AMI_ID
instance_type                       = var.Dev_instance_type
instance_keypair                    = var.Dev_instance_keypair
subnet_ID                           = var.Dev_subnet_ID
user_data_script_path               = var.Dev_user_data_script_path
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------- Target Group -----------------------------------#
target_group_name                   = var.Dev_target_group_name
target_group_port                   = var.Dev_target_group_port
target_group_protocol               = var.Dev_target_group_protocol
TG_vpc_id                           = var.Dev_TG_vpc_id
health_check_path                   = var.Dev_health_check_path
health_check_port                   = var.Dev_health_check_port
health_check_interval               = var.Dev_health_check_interval
health_check_timeout                = var.Dev_health_check_timeout
health_check_healthy_threshold      = var.Dev_health_check_healthy_threshold
health_check_unhealthy_threshold    = var.Dev_health_check_unhealthy_threshold
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#------------------------------- Listener rule of ALB -----------------------------#
listener_arn                         = var.Dev_listener_arn
path_pattern                         = var.Dev_path_pattern
action_type                          = var.Dev_action_type
priority                             = var.Dev_priority
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------Configure Auto Scaling group ---------------------------#
autoscaling_group_name              = var.Dev_autoscaling_group_name
min_size                            = var.Dev_min_size
max_size                            = var.Dev_max_size
desired_capacity                    = var.Dev_desired_capacity
}
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
