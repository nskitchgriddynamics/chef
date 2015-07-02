#
# Cookbook Name:: zabbix
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.



zabbix_agent "zabbix_agent223" do
	app_dir "/tmp/nickTest_agent1"
    item "nickTest.nickCount4"
    action :create
end 

yum_package "zabbix-agent" do 
	action :install
end

service "zabbix-agent" do
	action [:enable, :restart]
end

yum_package "zabbix-get" do 
	action :install
end



