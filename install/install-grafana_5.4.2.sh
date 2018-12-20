#!/bin/bash
# Install Grafana 5.4.2 for CentOS 7
# Author:      Douglas Esteves 
# date:        20-Dezember-2018

# CentOS 7 & Redhat
yum install -y https://dl.grafana.com/oss/release/grafana-5.4.2-1.x86_64.rpm 

# Start service Grafana
service grafana-server start

#
/sbin/chkconfig -add grafana-server

#  start service automatically at boot 
systemctl enable grafana-server

# list many plugins
grafana-cli plugins list-remote

# Install plugin to zabbix in grafana
grafana-cli plugins install alexanderzobnin-zabbix-app

# Restart service Grafana
service grafana-server restart
