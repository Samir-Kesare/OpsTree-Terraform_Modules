variable "sec-grp-name" {
  description     = "Name of the security group"
  type            = string
  default         = "pga-sg"
}
variable "sec-grp-description" {
  description     = "Description for the security group"
  type            = string
  default         = "Security group for PGA Server in Management Env"
}
variable "vpc-id" {
  description     = "ID of the VPC for instances"
  type            = string
}

variable "inbound-ports" {
  description     = "List of inbound ports, protocols and cidr block"
  type            = list(map(any))
  default         = [
    { port = 22, protocol = "TCP",cidr_blocks = "20.0.0.0/28" },  
  ]
}

variable "outbound-ports" {
  description     = "List of outbound ports, protocols and CIDR block "
  type            = list(map(any))
  default         = [
    { port = 0, protocol = "-1", cidr_blocks = "0.0.0.0/0", },
  ]
}
variable "sec-grp-tags" {
  type            = map(string)
  default         = {
    Name          = "pga-sg"
    Enviroment    = "Management"
    Owner         = "Shantanu"
  }
}

variable "key-name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "server-type" {
  description = "Instance type for pga server"
  type        = string
}

variable "subnet-id" {
  description = "Id of the subnet for the pga server"
  type        = string
}

variable "server-name" {
  description = "Name tag for the pga server"
  type        = string
}
