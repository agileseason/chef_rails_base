# sudo apt-get update
include_recipe 'apt'

# libxml2 required by nokogiri is installed in rvm cookbook
# don't use appbox::tools - install required packages here

package 'git'
package 'htop'
package 'mc'

package 'vim'
package 'screen'
package 'zsh'

# for rmagick gem
package 'libmagickwand-dev'
package 'imagemagick'

# for deploy:assets:precompile capistrano task
# (maybe it's ubuntu-specific)
package 'libcurl4-openssl-dev'

# to compile gem native extensions
package 'libgmp-dev'

# to compile ruby on Ubuntu-14.04-x64 (08.12.2017), was error:
#   make: *** [rdoc] Error 137
# NOTE: Delete this after successuf creating a new server.
# package 'libtcltk-ruby'
# package 'libffi-dev'
