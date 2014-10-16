class profile::base {
  if $operatingsystem == 'Windows' {
    include profile::iesec
    include windows_puppet
    include chocolatey_sw
    
    #Ensure Notepad++ is installed
    package { 'notepadplusplus.install':
      ensure => present,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }
      
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
