class v_profile_base::base(
  $ntp_servers = [
    '0.ubuntu.pool.ntp.org',
    '1.ubuntu.pool.ntp.org',
  ],
) {
  include ::v_ssh
  class { '::v_ntp':
    servers => $ntp_servers,
  }
  
  if $facts['os']['family'] == 'RedHat' {
    include ::v_profile_selinux::selinux
  }
}
