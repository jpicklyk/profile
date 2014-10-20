class profile::domain_member (
  $domain     = hiera('windows_ad::domainname'),
  $username   = hiera('profile::domain_member::username'),
  $password   = hiera('profile::domain_member::password')
) {
  
  class {'::domain_membership':
    domain        => $domain,
    username      => $username,
    password      => $password,
  }
  
  reboot { 'domain_member::after':
    subscribe => Class['domain_membership']
  }
}