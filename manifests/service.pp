# service.pp

class bsdpy::service{

  service { 'bsdpy':
    enable  => true,
    ensure  => running,
    require => File['/etc/init/bsdpy.conf'],
  }

}