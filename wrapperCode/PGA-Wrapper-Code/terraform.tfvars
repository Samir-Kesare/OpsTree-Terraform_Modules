vpc-id              = "vpc-0624da13cb0782e79"
key-name            = "pgaServerKey"
server-type         = "t2.medium"
subnet-id           = "subnet-0585fe1af0dbe43ec"
sec-grp-name = "pga-sg"
sec-grp-tags = {
    Name          = "pga-sg"
    Enviroment    = "Management"
    Owner         = "Shantanu"
}
server-name         = "EFK Server"
inbound-ports = [ {
  port = 9090 , protocol = "tcp" , security_group_ids = "sg-01bebc628cc635081"
},
{
 port = 3000 , protocol = "tcp" , security_group_ids = "sg-01bebc628cc635081"
},
{
 port = 9093 , protocol = "tcp" , security_group_ids = "sg-01bebc628cc635081"
},
{
 port = 24224 , protocol = "tcp" , cidr_blocks = "10.0.0.0/25"
},
{
 port = 24224 , protocol = "tcp" , cidr_blocks = "10.1.0.0/25"
},
{
 port = 22 , protocol = "tcp" , cidr_blocks = "0.0.0.0/0"
}
]
