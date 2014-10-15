class profile::base {
  if $operatingsystem == 'Windows' {
    include ::windows_puppet
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}