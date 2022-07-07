name             'chef_rails_base'
maintainer       'Andrey Sidorov'
maintainer_email 'takandar@gmail.com'
license          'MIT'
description      'Installs/Configures chef_rails_base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.1'

depends 'apt'
depends 'git'
depends 'user'
depends 'sudo'
depends 'nodejs'
depends 'memcached'
depends 'timezone_lwrp'
depends 'yarn'
depends 'zsh'
