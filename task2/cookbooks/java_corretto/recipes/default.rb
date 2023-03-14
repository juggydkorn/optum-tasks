#
# Cookbook:: java_corretto
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.
node.default['version'] ="8"
corretto_install node['version']