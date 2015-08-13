# nfs.pp

class bsdpy::nfs{
  $nbi_root  = $bsdpy::nbi_root

  include ::nfs::server

  ::nfs::server::export{ $nbi_root:
    ensure  => 'mounted',
    clients => '*(async,ro,no_root_squash,insecure)',
  }

}
