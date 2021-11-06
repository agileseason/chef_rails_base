resource_name :mkdir
provides :mkdir

property :path, name_property: true
property :owner, default: node['app']['user']['name']

action :create do
  # don't set recursive to true - owner, group and mode
  # options are not applied to created parent directories
  directory new_resource.path do
    owner new_resource.owner
    group 'apps'
    mode '0775'
  end
end
