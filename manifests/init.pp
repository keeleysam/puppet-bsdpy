# init.pp
class bsdpy(
  $nbi_root           = '/nbi',
  $nbi_root_user      = 'root',
  $nbi_root_group     = 'root',
  $bsdpy_revision     = 'master',
  $bsdpy_source       = 'https://bitbucket.org/bruienne/bsdpy.git',
  $pydhcplib_revision = 'master',
  $pydhcplib_source   = 'https://github.com/bruienne/pydhcplib.git',
  $boot_method        = 'http',
) {

  class{'bsdpy::install': } ->
  class{'bsdpy::vhost': } ->
  class{'bsdpy::vhost': } ->
  class{'bsdpy::tftp': } ->
  class{'bsdpy::service': } ->
  Class['bsdpy']

}