class profile::base {
  if $operatingsystem == 'Windows' {
    include profile::iesec
    include windows_puppet
    include chocolatey_sw
  
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
