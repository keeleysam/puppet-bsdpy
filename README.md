puppet-bsdpy
=====

Puppet module to setup BSDPy and keep it updated.

Uses nginx, tftpd-hpa, and nfs.

Tested only on Ubuntu 14.04 LTS.

Probably works on Ubuntu 12.04 LTS.

You are responsible for getting NetBoot images into /nbi!

Please see https://bitbucket.org/bruienne/bsdpy

Todo (open an issue and I will do them)
======
  Add systemd support
  
  Add netatalk support for Classic NetBoot.

Dependencies
====

https://github.com/puppetlabs/puppetlabs-stdlib

https://github.com/puppetlabs/puppetlabs-tftp

https://github.com/puppetlabs/puppetlabs-vcsrepo

https://github.com/puppetlabs/puppetlabs-gcc

https://github.com/puppetlabs/puppetlabs-git

https://github.com/jfryman/puppet-nginx

https://github.com/stankevich/puppet-python

https://github.com/echocat/puppet-nfs
