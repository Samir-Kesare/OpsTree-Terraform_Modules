module "Dev_Frontend_ASG" {
# source                              = "git::https://github.com/CodeOps-Hub/Terraform-modules/tree/main/Auto_Sacling_Module"
source                              = "git::https://<Vishalkk1998>:<Vishal-PAT-DSL>@github.com/CodeOps-Hub/Terraform-modules.git//Auto_Scaling_Module?ref=main"
#---------------------------------Security Group ----------------------------------#
security_name                       = var.Dev_Frontend_security_name
Security_description                = var.Dev_Frontend_security_description
SG_vpc_id                           = var.Dev_Frontend_SG_vpc_id
inbound_ports                       = var.Dev_Frontend_inbound_ports
outbound_ports                      = var.Dev_Frontend_outbound_ports
Sg_tags                             = var.Dev_Frontend_Sg_tags
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------Launch Template ----------------------------------
private_key_algorithm               = var.Dev_Frontend_private_key_algorithm
private_key_rsa_bits                = var.Dev_Frontend_private_key_rsa_bits
template_name                       = var.Dev_Frontend_template_name
template_description                = var.Dev_Frontend_template_description
AMI_ID                              = var.Dev_Frontend_AMI_ID
instance_type                       = var.Dev_Frontend_instance_type
instance_keypair                    = var.Dev_Frontend_instance_keypair
subnet_ID                           = var.Dev_Frontend_subnet_ID
user_data_script_path               = var.Dev_Frontend_user_data_script_path
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------- Target Group -----------------------------------#
target_group_name                   = var.Dev_Frontend_target_group_name
target_group_port                   = var.Dev_Frontend_target_group_port
target_group_protocol               = var.Dev_Frontend_target_group_protocol
TG_vpc_id                           = var.Dev_Frontend_TG_vpc_id
health_check_path                   = var.Dev_Frontend_health_check_path
health_check_port                   = var.Dev_Frontend_health_check_port
health_check_interval               = var.Dev_Frontend_health_check_interval
health_check_timeout                = var.Dev_Frontend_health_check_timeout
health_check_healthy_threshold      = var.Dev_Frontend_health_check_healthy_threshold
health_check_unhealthy_threshold    = var.Dev_Frontend_health_check_unhealthy_threshold
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#------------------------------- Listener rule of ALB -----------------------------#
listener_arn                         = var.Dev_Frontend_listener_arn
path_pattern                         = var.Dev_Frontend_path_pattern
action_type                          = var.Dev_Frontend_action_type
priority                             = var.Dev_Frontend_priority
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------Configure Auto Scaling group ---------------------------#
autoscaling_group_name              = var.Dev_Frontend_autoscaling_group_name
min_size                            = var.Dev_Frontend_min_size
max_size                            = var.Dev_Frontend_max_size
desired_capacity                    = var.Dev_Frontend_desired_capacity
}
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
