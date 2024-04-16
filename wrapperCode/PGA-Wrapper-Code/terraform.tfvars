vpc-id              = "vpc-037273df63a16de65"
key-name            = "pgaServerKey"
server-type         = "t2.medium"
subnet-id           = "subnet-029ac81220960564f"
sec-grp-name = "pga-sg"
sec-grp-tags = {
    Name          = "pga-sg"
    Enviroment    = "Management"
    Owner         = "Shantanu"
}
server-name         = "PGA Server"
inbound-ports = [ {
  port = 9090 , protocol = "tcp" , security_group_ids = "sg-05a6ffc3303fb3208"
},
{
 port = 3000 , protocol = "tcp" , security_group_ids = "sg-05a6ffc3303fb3208"
},
{
 port = 9093 , protocol = "tcp" , security_group_ids = "sg-05a6ffc3303fb3208"
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
