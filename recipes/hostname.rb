# frozen_string_literal: true

resource_name :hostname

property :name, name_property: true

action :create do
  file '/etc/hostname' do
    content name
  end
  execute "hostname '#{name}'" do
    not_if "hostname -eq '#{name}'"
  end
end
