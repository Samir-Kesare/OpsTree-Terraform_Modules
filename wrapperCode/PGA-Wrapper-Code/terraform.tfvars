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
server-name         = "PGA Server"
inbound-ports = [ {
  port = 9090 , protocol = "tcp" , security_group_ids = "sg-096169f05a62a20cf"
},
{
 port = 3000 , protocol = "tcp" , security_group_ids = "sg-096169f05a62a20cf"
},
{
 port = 9093 , protocol = "tcp" , security_group_ids = "sg-096169f05a62a20cf"
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
