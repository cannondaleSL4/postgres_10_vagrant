#!/bin/bash

echo "-------------------- updating package lists"
apt-get update

echo "-------------------- installing postgres"
apt-get install postgresql -y

echo "-------------------- Server listen to all IPs"
sudo sed -i "s/#listen_address.*/listen_addresses '*'/" /etc/postgresql/10/main/postgresql.conf

echo "-------------------- Allow all connections to Server"
sudo cat >> /etc/postgresql/10/main/pg_hba.conf <<EOF
  # Accept all IPv4 connections - FOR DEVELOPMENT ONLY!!!
  host    all         all         0.0.0.0/0             md5
EOF

#echo "-------------------- creating postgres vagrant role with password vagrant"
# Create Role and login
#sudo su postgres -c "psql -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" "


# Create database
#sudo su postgres -c "createdb -E UTF8 -T template0 --locale=en_US.utf8 -O vagrant backup_test"

set_user_password="psql --command \"ALTER USER postgres WITH PASSWORD 'postgres';\""
sudo su postgres --command "$set_user_password"


# Update packages
apt-get upgrade -y

# restart DB
sudo service postgresql restart
