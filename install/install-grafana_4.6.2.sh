#!/bin/bash
# Install Grafana 4.6.2 for CentOS 7
# Author:       Douglas Esteves <douglas@iotmakers.com.br>
# date:         27-out-2017

# CentOS 7 & Redhat
yum install -y https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.6.2-1.x86_64.rpm 

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
