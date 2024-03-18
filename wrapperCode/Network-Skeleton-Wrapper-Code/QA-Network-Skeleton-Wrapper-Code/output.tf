output "vpc-id" {
  value = module.network.vpc-id
}

output "public-subnets-id" {
  value = module.network.public-subnets-id
}


output "private-subnets-id" {
  value = module.network.private-subnets-id
}

output "dev-igw-id" {
  value = module.network.dev-igw-id
}

output "QA-nat-id" {
  value = module.network.QA-nat-id
}

output "QA-public-RTB-id" {
  value = module.network.QA-public-RTB-id
}

output "QA-private-RTB-id" {
  value = module.network.QA-private-RTB-id
}

output "QA-frontend-nacl-id" {
  value = module.network.QA-frontend-nacl-id
}

output "QA-backend-nacl-id" {
  value = module.network.QA-backend-nacl-id
}

output "QA-db-nacl-id" {
  value = module.network.QA-db-nacl-id
}

output "alb-sg-id" {
  value = module.network.alb-sg-id  
}

output "QA-alb-dns" {
  value = module.network.QA-alb-dns
}

output "QA-route53-zone" {
  value = module.network.QA-route53-zone
}
output "QA-route53-record" {
  value = module.network.QA-route53-record
}
