#!/bin/bash

sudo apt update -y
sudo apt install irpas

my_name="sharan"
timestamp=$(date '+%d%m%Y-%H%M%S')
s3_bucket="upgrad-new"

sudo apt install apache2
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
sudo systemctl status apache2

# Creating tar of log files present inside /var/logs/apache2 and storing them in /tmp

sudo tar -cvf tmp/${my_name}-httpd-logs-${timestamp}.tar var/log/apache2

# Copying tar files from /tmp to s3 bucket

sudo aws s3 cp /tmp/${my_name}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${my_name}-httpd-logs-${timestamp}.tar

sudo chmod  +x  /Automation_Project/automation.sh