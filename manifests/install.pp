# == Class: opendkim::install
#

class opendkim::install(
  $package                 = $::opendkim::package,
  $ensure_version          = $::opendkim::ensure_version,
  $service                 = $::opendkim::service,
){

  package { $package:
    ensure => $ensure_version,
    alias  => 'opendkim',
    notify => Service[$service],
  }

}
