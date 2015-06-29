#
# Cookbook Name:: zabbix
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

yum_package "zabbix-agent" do 
	action :install
end

service "zabbix-agent" do
	action [:enable, :start]
end