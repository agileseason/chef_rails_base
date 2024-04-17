chef_rails_base CHANGELOG
=====================

0.3.2
-----
- Upgrade nodejs to 20.9.0

0.3.1
-----
- Run `nodejs::nodejs_from_binary`nodejs::nodejs_from_binary` reciope to install node

0.3.0
-----
- Update for CHEF version > 16

0.2.6
-----
- Set memcached listen address to 127.0.0.1 to prevent unwanted connections from internet.

0.2.5
-----
- Remove locale cookbook. Use chef-14 locale resource instead.

0.2.3
-----
- Fix nodejs checksum attr

0.2.2
-----
- A better way to specify nodejs version: `node['chef_rails_base']['nodejs']['version']`

0.2.0
-----
- Delete hostname resource. It is added into CHEF version > 14

0.1.0
-----
- Initial release
