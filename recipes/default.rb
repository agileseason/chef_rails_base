# frozen_string_literal: true

AppHelpers.new(node['app']).check!

package 'locales-all' if node['platform'] == 'debian'

include_recipe 'locale'
include_recipe 'git'

if node['chef_rails_base']['nodejs']['enabled']
  node.override['nodejs']['install_method'] = 'binary'
  node.override['nodejs']['version'] = node['chef_rails_base']['nodejs']['version']

  # for sprockets
  include_recipe 'nodejs'
  include_recipe 'yarn::default'
end

if node['chef_rails_base']['memcached']['enabled']
  include_recipe 'memcached::default'
end

# hostname node['app']['hostname'] if node['app']['hostname']

include_recipe 'chef_rails_base::packages'
include_recipe 'chef_rails_base::user'

timezone node['timezone']
