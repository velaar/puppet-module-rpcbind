# == Class: rpcbind
#
# Manage rpcbind
#
class rpcbind (
  $package_ensure = 'installed',
  $package_name   = 'rpcbind',
  $service_enable = true,
  $service_ensure = 'running',
  $service_name   = 'rpcbind',
) {

  package { 'rpcbind_package':
    ensure => $package_ensure,
    name   => $package_name,
  }

  service { 'rpcbind_service':
    ensure  => $service_ensure,
    name    => $service_name,
    enable  => $service_enable,
    require => Package['rpcbind_package'],
  }
}
