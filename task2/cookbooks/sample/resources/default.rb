resource_name :default
provides :default

actions :create 
attribute :title, kind_of: String, default: "Juggyd page!!!" 
attribute :path, kind_of: String, default: "/var/www/html/index.html"