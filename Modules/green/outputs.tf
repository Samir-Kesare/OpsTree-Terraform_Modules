#--------------------------------Launch Template ----------------------------------#

# Priavte Key
output "key_pair_name" {
  description = "key name"
  value       = aws_key_pair.key_pair.key_name
}

# Template
output "launch_template_id" {
  value = aws_launch_template.green_template.id
}

#--------------------------------- Target Group -----------------------------------#

output "Target_group_id" {
  value = aws_lb_target_group.green_tg.id
}

output "final_target_group_arn" {
  value = local.final_target_group_arn
}

#--------------------------Configure Auto Scaling group ---------------------------#

output "Autoscaling_group_id" {
  value = aws_autoscaling_group.green_ASG.id
}

#---------------------------- Auto Scaling Policies -------------------------------#

output "Autoscaling_policy_name" {
  value       = aws_autoscaling_policy.green_ASG_Policy.name
}
