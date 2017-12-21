default['app']['name'] = nil
default['app']['env'] = nil
default['app']['ruby_version'] = nil
default['app']['hostname'] = nil
default['app']['domain'] = nil

default['app']['user'] = {
  'name' => nil,
  'home' => nil,
  'shell' => nil,
  'groups' => nil
}

default['app']['dirs'] = {
  'app' => nil,
  'env' => nil,
  'root' => nil,
  'releases' => nil,
  'shared' => nil,
  'config' => nil,
  'log' => nil,
  'log_old' => nil,
  'tmp' => nil,
  'nginx_cache' => nil,
  'nginx_keys' => nil
}

default['app']['secrets'] = nil
default['app']['ssh_keys'] = nil
