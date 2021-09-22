#!/usr/bin/sh
set -x

echo "Installing java8"
sudo apt-get update
sudo apt install openjdk-8-jdk-headless -y

echo "Installing jenkins"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
