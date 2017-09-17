include_recipe 'locale'

# for sprockets
include_recipe 'nodejs'
include_recipe 'yarn::default'

include_recipe 'memcached::default'

include_recipe 'appbox::users'
include_recipe 'appbox::apps_dir'

node['app']['dirs'].each do |key, dir|
  next if key == 'root'
  mkdir dir
end

include_recipe 'chef_rails_base::packages'

hostname node['app']['hostname'] if node['app']['hostname']
timezone node['timezone']
