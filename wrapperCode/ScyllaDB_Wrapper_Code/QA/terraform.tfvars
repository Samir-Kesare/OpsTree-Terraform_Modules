vpc-id              = "vpc-0b4c152fb02b0af32"
key-name            = "scyllaDBKeyDev.pem"
server-type         = "t2.medium"
subnet-id           = "subnet-0eb88feb4f7ec9f95"
sec-grp-name = "scylladb-dev-sg"
sec-grp-tags = {
    Name          = "scylladb-dev-sg"
    Enviroment    = "Dev"
    Owner         = "Aakash"
}
server-name         = "ScyllaDB-Server-Dev"
inbound-ports = [ {
  port = 22 , protocol = "tcp" , security_group_ids = "sg-0367b8b3d6b6b36c9" 
},
{
 port = 9042 , protocol = "tcp" , security_group_ids = "sg-0b1982ff2c211d41a"
},
{
 port = 22 , protocol = "tcp" , cidr_blocks = "20.0.0.0/28"
} ]