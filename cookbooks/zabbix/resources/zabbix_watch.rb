

actions :create, :delete
default_action :create

attribute :scan_dir, :name_attribute => true, :kind_of => String,
            :required => true, :regex => Resolv::IPv4::Regex

attribute :app_dir       , :kind_of => String
attribute :item          , :kind_of => String

attr_accessor :exists