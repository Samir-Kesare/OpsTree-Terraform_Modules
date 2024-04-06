resource "aws_lb_target_group" "target-group" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.tg_vpc_id

  health_check {
    path                = var.tg_health_check_path
    protocol            = var.tg_protocol
    port                = var.tg_health_check_port
    interval            = var.tg_health_check_interval
    timeout             = var.tg_health_check_timeout
    healthy_threshold   = var.tg_health_check_healthy_threshold
    unhealthy_threshold = var.tg_health_check_unhealthy_threshold
  }

  tags = var.tg_tags
}
