variable "sec_grp_name" {
  description     = "Name for the security group"
  type            = string
  default         = "dev_sg"
}
variable "Sec_grp_description" {
  description     = "Description for the security group"
  type            = string
  default         = "Security group for Dev Env"
}
variable "vpc_id" {
  description     = "ID of the VPC for instances"
  type            = string
}

variable "inbound_ports" {
  description     = "List of inbound ports, protocols and cidr block"
  type            = list(map(any))
  default         = [
    { port = 22, protocol = "tcp",cidr_blocks = "20.0.0.0/28" }, 
    { port = 22, protocol = "TCP", security_group_ids = "sg-051aa66773d7b86c9" },
  ]
}

variable "outbound_ports" {
  description     = "List of outbound ports, protocols and Cidr block "
  type            = list(map(any))
  default         = [
    { port = 0, protocol = "-1", cidr_blocks = "0.0.0.0/0", },
  ]
}
variable "Sec_grp_tags" {
  type            = map(string)
  default         = {
    Name          = "dev-sg"
    Enviroment    = "dev"
    Owner         = "shreya"
  }
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "server_type" {
  description = "Instance type for Standalone server"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the Standalone server"
  type        = string
}

variable "server_name" {
  description = "Name tag for the standalone server"
  type        = string
}
