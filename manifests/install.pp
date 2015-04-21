# install.pp

class bsdpy::install {

  $bsdpy_revision     = $bsdpy::bsdpy_revision
  $bsdpy_source       = $bsdpy::bsdpy_source
  $pydhcplib_revision = $bsdpy::pydhcplib_revision
  $pydhcplib_source   = $bsdpy::pydhcplib_source
  $nbi_root           = $bsdpy::nbi_root
  $boot_method        = $bsdpy::boot_method

  include git
  include gcc

  class { 'python' :
    pip => true,
    dev => true,
  }

  package { 'docopt':
    ensure   => latest,
    provider => pip,
    require  => Class['python'],
  }

  vcsrepo { '/usr/local/bsdpy':
    ensure   => present,
    provider => git,
    source   => $bsdpy_source,
    revision => $bsdpy_revision,
  }

  vcsrepo { '/usr/local/pydhcplib':
    ensure   => present,
    provider => git,
    source   => $pydhcplib_source,
    revision => $pydhcplib_revision,
  }

  exec { '/usr/bin/python setup.py install':
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    cwd         => '/usr/local/pydhcplib',
    refreshonly => true,
    subscribe   => Vcsrepo['/usr/local/pydhcplib'],
    require     => Class['python'],
  }

  file { "$nbi_root" :
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0775',
  }

  file { '/etc/init/bsdpy.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('bsdpy/bsdpy.conf.erb'),
    notify  => Service['bsdpy'],
  }

}