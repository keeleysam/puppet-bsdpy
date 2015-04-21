# tftp.pp

class bsdpy::tftp{
  $nbi_root  = $bsdpy::nbi_root

  class { '::tftp': 
    directory => $nbi_root,
    address   => $::ipaddress,
    options   => '--timeout 60',
  }

}