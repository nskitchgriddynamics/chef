# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "nick34343"
client_key               "#{current_dir}/nick34343.pem"
validation_client_name   "notreal-validator"
validation_key           "#{current_dir}/notreal-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/notreal"
cookbook_path            ["#{current_dir}/../cookbooks"]
