class profile::base {
  if $operatingsystem == 'Windows' {
    include profile::iesec
    include windows_puppet
      
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
