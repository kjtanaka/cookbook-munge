name             'munge'
maintainer       'FutureGrid'
maintainer_email 'kj.tanaka@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures munge'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(redhat centos fedora).each do |os|
	  supports os
end

depends 'yum-epel'
