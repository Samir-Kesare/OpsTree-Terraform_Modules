#--------------------------------- Target Group -----------------------------------#

output "target_group_id" {
  value = [aws_lb_target_group.target-group.id]
}