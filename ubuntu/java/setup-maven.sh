#!/bin/bash

echo "Install Java Developers Kit"
sudo apt-get install -y sun-java6-jdk
java -version

export SETUP_MAVEN_VERSION=2.2.0
wget http://mirror.cc.columbia.edu/pub/software/apache/maven/binaries/apache-maven-$SETUP_MAVEN_VERSION-bin.tar.gz
tar -xzf apache-maven-$SETUP_MAVEN_VERSION-bin.tar.gz
sudo mv apache-maven-$SETUP_MAVEN_VERSION /usr/share/maven
sudo ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

echo "Setup Maven SETUP_MAVEN_VERSION in /usr/share/maven."
ls -l /usr/bin/mvn
