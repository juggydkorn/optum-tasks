#
# Cookbook:: my_users
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.
users_manage "rebels" do
  group_id 1138
  action [ :remove, :create]
end

node.default['authorization']['sudo']['passwordless'] = true
include_recipe "sudo"