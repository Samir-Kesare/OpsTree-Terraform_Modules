#---------------------------------Security Group ----------------------------------#

output "Security_Group_ID" {
  value = [module.Dev_Frontend_ASG.Security_Group_ID]
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------Launch Template ----------------------------------#

# Priavte Key
output "key_pair_name" {
  value       = [module.Dev_Frontend_ASG.key_pair_name]
}

# Template
output "launch_template_id" {
  value = [module.Dev_Frontend_ASG.launch_template_id]
}
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------- Target Group -----------------------------------#

output "Target_group_id" {
  value = [module.Dev_Frontend_ASG.Target_group_id]
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------Configure Auto Scaling group ---------------------------#

output "Autoscaling_group_id" {
  value = [module.Dev_Frontend_ASG.Autoscaling_group_id]
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#---------------------------- Auto Scaling Policies -------------------------------#

output "Autoscaling_policy_name" {
  value       = [module.Dev_Frontend_ASG.Autoscaling_policy_name]
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
