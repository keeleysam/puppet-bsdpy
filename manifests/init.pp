# == Class: bsdpy

class bsdpy (

) inherits ::bsdpy::params {

  class{'bsdpy::install': } ->
  class{'bsdpy::service': } ->
  Class['bsdpy']
}
