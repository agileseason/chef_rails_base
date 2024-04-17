# frozen_string_literal: true

AppHelpers.new(node['app']).check!

package 'locales-all' if node['platform'] == 'debian'

locale 'set system locale' do
  lang node['locale']['lang']
end

include_recipe 'git'

if node['chef_rails_base']['nodejs']['enabled']
  node.override['nodejs']['install_method'] = 'binary'
  node.override['nodejs']['version'] = node['chef_rails_base']['nodejs']['version']
  node.override['nodejs']['binary']['checksum']['linux_x64'] =
    node['chef_rails_base']['nodejs']['checksum']

  include_recipe 'nodejs::nodejs_from_binary'
  include_recipe 'yarn::default'
end

if node['chef_rails_base']['memcached']['enabled']
  memcached_instance 'memcached' do
    memory node['memcached']['memory']
    port node['memcached']['port']
    udp_port node['memcached']['udp_port']
    listen node['memcached']['listen']
    maxconn node['memcached']['maxconn']
    user service_user
    max_object_size node['memcached']['max_object_size']
    threads node['memcached']['threads']
    experimental_options node['memcached']['experimental_options']
    extra_cli_options node['memcached']['extra_cli_options']
    ulimit node['memcached']['ulimit']
    action [:start, :enable]
    disable_default_instance false
  end
end

# hostname node['app']['hostname'] if node['app']['hostname']

include_recipe 'chef_rails_base::packages'
include_recipe 'chef_rails_base::user'

timezone node['timezone']
