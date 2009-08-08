#!/bin/bash

echo "Install Java Developers Kit"
sudo apt-get install -y sun-java6-jdk

export SETUP_TOMCAT_VERSION_MAJOR=5
export SETUP_TOMCAT_VERSION=5.5.27
wget http://apache.promotionalpromos.com/tomcat/tomcat-$SETUP_TOMCAT_VERSION_MAJOR/v$SETUP_TOMCAT_VERSION/bin/apache-tomcat-$SETUP_TOMCAT_VERSION.tar.gz
tar xzf apache-tomcat-$SETUP_TOMCAT_VERSION.tar.gz
sudo mv apache-tomcat-$SETUP_TOMCAT_VERSION /usr/share/tomcat$SETUP_TOMCAT_VERSION_MAJOR
sudo ln -s /usr/share/tomcat$SETUP_TOMCAT_VERSION_MAJOR /usr/share/tomcat

echo "Setup Tomcat $SETUP_TOMCAT_VERSION in /usr/share/tomcat$SETUP_TOMCAT_VERSION_MAJOR."
ls -l /usr/share/tomcat
