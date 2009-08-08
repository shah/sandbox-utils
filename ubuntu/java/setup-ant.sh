#!/bin/bash

echo "Install Java Developers Kit"
sudo apt-get install -y sun-java6-jdk
java -version

export SETUP_ANT_VERSION=1.7.1
wget http://apache.promopeddler.com/ant/binaries/apache-ant-$SETUP_ANT_VERSION-bin.tar.gz
tar -xzf apache-ant-$SETUP_ANT_VERSION-bin.tar.gz
sudo mv apache-ant-$SETUP_ANT_VERSION /usr/share/ant
sudo ln -s /usr/share/ant/bin/ant /usr/bin/ant

echo "Setup Ant $SETUP_ANT_VERSION in /usr/share/ant."
ls -l /usr/bin/ant

echo ""
echo "NOTE: Put JARs you want Ant to use for startup into $HOME/.ant/lib"
