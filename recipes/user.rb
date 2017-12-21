app = AppHelpers.new node['app']

user_account app.user do
  comment 'apps runner, deployer and sysadmin'
  ssh_keys app.node['ssh_keys']
  ssh_keygen true
  shell app.node['user']['shell']
  home app.node['user']['home']
end

group app.group do
  action :create
  members app.user
end

node.default['authorization']['sudo']['groups'] = [
  'sudo',
  app.user
]
node.default['authorization']['sudo']['passwordless'] = true
# node.default['authorization']['sudo']['sudoers_defaults'] = %w(
  # env_reset
  # secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  # !lecture,tty_tickets,!fqdn
# )
include_recipe 'sudo'

if app.node['user']['shell'] == '/bin/zsh'
  include_recipe 'chef_rails_base::zsh'
end
