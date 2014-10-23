class profile::base {
  if $operatingsystem == 'Windows' {
    include profile::iesec
    include windows_puppet
    include profile::win_default_apps
    include profile::software_share
    
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
