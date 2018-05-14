AppHelpers.new(node['app']).check!

if node['platform'] == 'debian'
  package 'locales-all'
end
include_recipe 'locale'
include_recipe 'git'

# for sprockets
include_recipe 'nodejs'
include_recipe 'yarn::default'

if node['chef_rails_base']['memcached']['enabled']
  include_recipe 'memcached::default'
else
  memcached_instance 'memcached' do
    action :remove
  end
end

hostname node['app']['hostname'] if node['app']['hostname']

include_recipe 'chef_rails_base::packages'
include_recipe 'chef_rails_base::user'

timezone node['timezone']
