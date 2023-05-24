#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 600" -H "X-aws-ec2-metadata-token: true"`
instance_id=$(curl -H "X-aws-ec2-metadata-token: ${TOKEN}" http://169.254.169.254/latest/meta-data/instance-id)
echo "Hello from ${HOSTNAME}. This instnace ID is ${instance_id}" >> /usr/share/nginx/html/index.html
#echo "Hello from ${instance_id}" >> /usr/share/nginx/html/index.html