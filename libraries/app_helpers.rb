class AppHelpers
  def initialize app_node
    @app_node = app_node
  end

  def name
    @app_node['name']
  end

  def user
    @app_node['user']['name']
  end

  def group
    @app_node['user']['groups'].first()
  end

  def env
    @app_node['env']
  end

  def dir value
    @app_node['dirs'][value.to_s]
  end

  def ruby_version
    @app_node['ruby_version']
  end

  def service value
    "#{name}_#{value}_#{env}"
  end

  def node
    @app_node
  end

  def check!
    fail "node['app'] is not set" if @app_node.nil?

    fail "node['app']['env'] is not set" if env.nil?
    fail "node['app']['ruby_version'] is not set" if ruby_version.nil?

    fail "node['app']['name'] is not set" if node['name'].nil?

    fail "node['app']['user'] is not set" if node['user'].nil?
    fail "node['app']['user']['name'] is not set" if node['user']['name'].nil?
    fail "node['app']['user']['home'] is not set" if node['user']['home'].nil?
    fail "node['app']['user']['shell'] is not set" if node['user']['shell'].nil?
    fail "node['app']['user']['groups'] is not set" if node['user']['groups'].nil? || node['user']['groups'].none?

    fail "node['app']['ssh_keys'] is not set" if node['ssh_keys'].nil? || node['ssh_keys'].none?
  end
end
