include_recipe 'nodejs::install' if node['nodejs']['manage_node']
include_recipe 'nodejs::npm' if node['nodejs']['manage_node']
include_recipe 'nodejs::npm_packages' if node['nodejs']['manage_node']
