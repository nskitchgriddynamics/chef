use_inline_resources

action :create do
 log " My name is #{new_resource.name} and I'm about to be created!"
    
  # this will be dir that has files counted
  directory new_resource.app_dir do 
    recursive true
    # default action is create so no need to specify create of course
  end

  template "#{node[:zabbix][:config_file2]}userparameter_"<<new_resource.name << ".conf" do
    source "crond.erb"
    owner "zabbix"
    group "zabbix"
    mode "0750"
    variables(
      :app_dir => new_resource.app_dir,
      :item => new_resource.item
      
    )
    # the notify does not work at this level. worked in the recipe, but out of scope in provider. Even /
    # even when I use use_inline_resources   .. not sure why
    #new_resource.notifies :restart, "service[zabbix-agent]"
  end
end

action :delete do
  log " my name is #{new_resource.name} and I'm about to get deleted!"
  directory new_resource.app_dir do
    recursive true
    action :delete
  end

  file "#{node[:zabbix][:config_file2]}/userparameter_"<<new_resource.name << ".conf" do
    action :delete
  end

end