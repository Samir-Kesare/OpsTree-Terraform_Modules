#--------------------------------- Target Group -----------------------------------#

variable "tg_name" {
  description     = "Name of the target group"
  type            = string
  default         = "Frontend-TG"
}
variable "tg_port" {
  description     = "Port for the target group"
  type            = number 
  default         = 3000
}
variable "tg_protocol" {
  description     = "Protocol for the target group"
  type            = string
  default         = "HTTP"
}
variable "tg_vpc_id" {
  description     = "ID of the VPC"
  type            = string
  default         = "vpc-02b7e3d8ee6fd3c38"    
}
variable "tg_health_check_path" {
  description     = "The destination for the health check request"
  type            = string
  default         = "/"
}
variable "tg_health_check_port" {
  description     = "The port to use to connect with the target for health checking"
  type            = string
  default         = "traffic-port"
}
variable "tg_health_check_interval" {
  description     = "The approximate amount of time, in seconds, between health checks of an individual target"
  type            = number
  default         = 30
}
variable "tg_health_check_timeout" {
  description     = "The amount of time, in seconds, during which no response means a failed health check"
  type            = number
  default         = 5
}
variable "tg_health_check_healthy_threshold" {
  description     = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  type            = number
  default         = 2
}
variable "tg_health_check_unhealthy_threshold" {
  description     = "The number of consecutive health check failures required before considering a target unhealthy"
  type            = number
  default         = 2
}

variable "tg_tags" {
  type    = map(string)
  default = {
    Enviroment = "dev"
    Owner = "harshit"
  }
}