use_inline_resources

action :create do
 log " My name is #{new_resource.name}"
    
  # this will hold file counts
  directory "#{node[:zabbix][:script_dir]}" do 
    recursive true
  end

  template "#{node[:zabbix][:config_file]}" do
    path "#{node[:zabbix][:config_file]}"
    source "zabbix_agentd.conf.erb"
    owner "zabbix"
    group "zabbix"
    mode "0750"
    variables(
      :app_dir => new_resource.app_dir,
      :item => new_resource.item
      
    )
    # the notify does not work at this level. worked in the recipe, but out of scope in provider
    #notifies :restart, "service[zabbix-agent]"
  end
end

