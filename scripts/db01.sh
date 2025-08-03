#! /usr/bin/bash

sudo -i 

# Update OS with latest patches
yum update -y

# Set Repository
yum install epel-release -y

#Install Maria DB Package
yum install git mariadb-server -y

#Starting & enabling mariadb-server
systemctl start mariadb
systemctl enable mariadb

# RUN mysql secure installation script.
# mysql_secure_installation

# Set DB name and users.
mysql -u root -padmin123 <<SQL
create database accounts;
grant all privileges on accounts.* TO 'admin'@'%' identified by 'admin123';
FLUSH PRIVILEGES;
SQL

# Download Source code & Initialize Database.
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project

mysql -u root -padmin123 accounts < src/main/resources/db_backup.sql
mysql -u root -padmin123 accounts

# Restart mariadb-server
systemctl restart mariadb
