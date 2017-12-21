AppHelpers.new(node['app']).check!

if node['platform'] == 'debian'
  package 'locales-all'
end
include_recipe 'locale'
include_recipe 'git'

# for sprockets
include_recipe 'nodejs'
include_recipe 'yarn::default'

include_recipe 'memcached::default'

include_recipe 'chef_rails_base::packages'
include_recipe 'chef_rails_base::user'

hostname node['app']['hostname'] if node['app']['hostname']
timezone node['timezone']
