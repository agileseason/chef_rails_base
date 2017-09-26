include_recipe 'locale'

# for sprockets
include_recipe 'nodejs'
include_recipe 'yarn::default'

include_recipe 'memcached::default'

include_recipe 'appbox::users'
include_recipe 'appbox::apps_dir'

include_recipe 'chef_rails_base::packages'

hostname node['app']['hostname'] if node['app']['hostname']
timezone node['timezone']
