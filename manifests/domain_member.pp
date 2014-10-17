class profile::domain_member (
  $domain     = hiera('windows_ad::domainname'),
  $username   = hiera('profile::domain_member::username'),
  $password   = hiera('profile::domain_member::password'),
  $options    = hiera('profile::domain_member::options', '1')
) {
  
  class {'domain_membership':
    domain        => $domain,
    username      => $username,
    password      => $password,
    join_options  => $options,
  }
}