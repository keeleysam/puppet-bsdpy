# vhost.pp

class bsdpy::vhost{
  $nbi_root  = $bsdpy::nbi_root

  class { 'nginx': }

  nginx::resource::vhost { $::fqdn :
    www_root => $nbi_root,
  }

}