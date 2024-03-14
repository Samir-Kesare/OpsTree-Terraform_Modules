module "QA_ASG" {
source                              = "git::https://github.com/CodeOps-Hub/Terraform-modules/tree/main/Auto_Sacling_Module"
#---------------------------------Security Group ----------------------------------#
#---------------------------------Security Group ----------------------------------#
security_name                       = var.QA_security_name
Security_description                = var.QA_security_description
SG_vpc_id                           = var.QA_SG_vpc_id
inbound_ports                       = var.QA_inbound_ports
outbound_ports                      = var.QA_outbound_ports
Sg_tags                             = var.QA_Sg_tags
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------Launch Template ----------------------------------
private_key_algorithm               = var.QA_private_key_algorithm
private_key_rsa_bits                = var.QA_private_key_rsa_bits
template_name                       = var.QA_template_name
template_description                = var.QA_template_description
AMI_ID                              = var.QA_AMI_ID
instance_type                       = var.QA_instance_type
instance_keypair                    = var.QA_instance_keypair
subnet_ID                           = var.QA_subnet_ID
user_data_script_path               = var.QA_user_data_script_path
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------- Target Group -----------------------------------#
target_group_name                   = var.QA_target_group_name
target_group_port                   = var.QA_target_group_port
target_group_protocol               = var.QA_target_group_protocol
TG_vpc_id                           = var.QA_TG_vpc_id
health_check_path                   = var.QA_health_check_path
health_check_port                   = var.QA_health_check_port
health_check_interval               = var.QA_health_check_interval
health_check_timeout                = var.QA_health_check_timeout
health_check_healthy_threshold      = var.QA_health_check_healthy_threshold
health_check_unhealthy_threshold    = var.QA_health_check_unhealthy_threshold
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#------------------------------- Listener rule of ALB -----------------------------#
listener_arn                         = var.QA_listener_arn
path_pattern                         = var.QA_path_pattern
action_type                          = var.QA_action_type
priority                             = var.QA_priority
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------Configure Auto Scaling group ---------------------------#
autoscaling_group_name              = var.QA_autoscaling_group_name
min_size                            = var.QA_min_size
max_size                            = var.QA_max_size
desired_capacity                    = var.QA_desired_capacity
}
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
