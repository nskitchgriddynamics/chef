#
# Cookbook Name:: zabbix
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

yum_package "zabbix-agent" do 
	action :install
end

service "zabbix-agent" do
	action [:enable, :restart]
end

yum_package "zabbix-get" do 
	action :install
end

# this will hold file counts
directory "#{node[:script_dir]}" do 
  recursive true
end

template "#{node[:config_file]}" do
  path "#{node[:config_file]}"
  source "zabbix_agentd.conf.erb"
  owner "zabbix"
  group "zabbix"
  mode "0750"
  notifies :restart, "service[zabbix-agent]"
end


