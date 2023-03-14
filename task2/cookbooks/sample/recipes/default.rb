#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

include_recipe 'hardening::default'
include_recipe 'java_corretto::default'
include_recipe 'nodejs::default'

# package 'httpd'

# file '/var/www/html/index.html' do
#   content 'Congrats on Chef demo'
# end

package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
end

# service 'httpd' do
#   action [:enable, :start]
# end

case node[:platform]
when 'redhat', 'centos'
  service 'httpd' do
    action [:enable, :start]
  end
when 'ubuntu', 'debian'
  service 'apache2' do
    action [:enable, :start]
  end
end

Chef.event_handler do
  on :run_failed do
    HandlerSendEmail::Helper.new.send_email_on_run_failure(
      Chef.run_context.node.name
    )
  end
end

# ruby_block 'fail the run' do
#   block do
#     raise 'deliberately fail the run'
#   end
# end