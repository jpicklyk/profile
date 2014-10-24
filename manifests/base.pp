class profile::base {
  if $operatingsystem == 'Windows' {
    contain profile::iesec
    contain windows_puppet
    contain profile::win_default_apps
    contain profile::software_share
    
    Class['profile::iesec'] -> Class['windows_puppet'] -> Class['profile::win_default_apps'] -> Class['profile::software_share']
    
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
