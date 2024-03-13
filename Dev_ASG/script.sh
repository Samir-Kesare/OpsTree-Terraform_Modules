#!/bin/bash

ALB_DNS="Dev-ALB-394440977.ap-northeast-1.elb.amazonaws.com"  # Change the DNS give actual DEV-ALB DNS
# Modify package.json with the ALB DNS placeholder
sed -i 's/"homepage": "https:\/\/opstree.github.io",/"homepage": "http:\/\/${ALB_DNS}",/' /home/ubuntu/Frontend/package.json
sed -i '/"proxy": "http:\/\/localhost:3000"/d' /home/ubuntu/Frontend/package.json

# Start your application
cd /home/ubuntu/Frontend 
npm start
