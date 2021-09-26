#!/usr/bin/sh
set -x
echo "Installing java"
sudo apt-get update
sudo apt install openjdk-8-jdk-headless -y

echo "Creating tomcat user"
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

echo "Installing tomcat"
VERSION="9.0.53"
wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz -P /tmp
sudo mkdir /opt/tomcat
sudo tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-${VERSION} /opt/tomcat/latest
sudo chown -RH tomcat: /opt/tomcat/latest
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
sudo sed -i 's/8080/8081/' /opt/tomcat/latest/conf/server.xml
sudo cp tomcat.service /etc/systemd/system
sudo systemctl daemon-reload

