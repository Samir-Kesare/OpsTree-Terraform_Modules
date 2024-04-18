#---------------------------------Security Group ----------------------------------#

output "Security_Group_ID" {
  value = aws_security_group.security_group.id
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------Launch Template ----------------------------------#

# Priavte Key
output "key_pair_name" {
  description = "key name"
  value       = aws_key_pair.key_pair.key_name
}

# Template
output "launch_template_id" {
  value = aws_launch_template.Template.id
}
#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------------- Target Group -----------------------------------#

output "Target_group_id" {
  value = aws_lb_target_group.Target_group.id
}

output "final_target_group_arn" {
  value = local.final_target_group_arn
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#--------------------------Configure Auto Scaling group ---------------------------#

output "Autoscaling_group_id" {
  value = aws_autoscaling_group.ASG.id
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
#---------------------------- Auto Scaling Policies -------------------------------#

output "Autoscaling_policy_name" {
  value       = aws_autoscaling_policy.ASG_Policy.name
}

#-----------------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -----------------------#
