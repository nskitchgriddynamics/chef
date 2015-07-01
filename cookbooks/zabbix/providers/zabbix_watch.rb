
# I used chef generate lwrp cookbooks/zabbix/ zabbix_watch   to create the dir structure.  I dodn't see that mentioend
# anywhere in the docs I was reading about lwrp.  I feel like there are a lot of 'gaps' in the material I am using.


def whyrun_supported?  #wtf is this? the definition of why-run on http://dougireton.com/blog/2013/01/07/creating-an-lwrp-part-2/  
  true                 # uses why-run to define what why-run is.  I Feel I am missing some fundemental lower level topics of why_run in chef.
end

action :create do # I understand this.  Chef reacts to state, so this first checks state then runs if (x)
  if @current_resource.exists 
    Chef::Log.info "#{ @new_resource } already exists - nothing to do."  #this is what I see when running in console.
  else
    converge_by("Create #{ @new_resource }") do   # ??? has something to do with messaging if in 'why_run' mode... (this is why text is green if it does an action)
      create_printer_port   # am I missing some code from this guys example?  what method is this??. maybe he was using pseduo code.
    end
  end
end

action :delete do  # delete, i get this. I will put code to remove a directory
  if @current_resource.exists
    converge_by("Delete #{ @new_resource }") do
      delete_printer_port
    end
  else
    Chef::Log.info "#{ @current_resource } doesn't exist - can't delete."
  end
end

def load_current_resource   #wtf is this?  is this needed in every provider?  what will I set mine to, I have no idea.  
  # I want it to test for the presence of 'app_dir' on the file system.  need to figure out what to use here.. 
  #@current_resource = Chef::Resource::zabbix_agent.new(@new_resource.name)          <-- just call it whatever?? (zabbix_agent)
  @current_resource = Chef::Resource::WindowsPrinterPort.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.ipv4_address(@new_resource.ipv4_address)  # does my resource have these??  how to find what to use?
  @current_resource.port_name(@new_resource.port_name || "IP_#{ @new_resource.ipv4_address }")

  if port_exists?(@current_resource.port_name)
    # TODO: Set @current_resource port properties from registry
    @current_resource.exists = true
  end
end

# is this jsut a snippet of code and I should not be using to source a skeleton struture for a lwpr?

# -- SNIP --   