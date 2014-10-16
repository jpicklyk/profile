class profile::base {
  if $operatingsystem == 'Windows' {
    include profile::iesec
    include windows_puppet
    include chocolatey_sw
    
    #Ensure Notepad++ is installed
    package { 'notepadplusplus.install':
      ensure => latest,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }
    
    #Ensure wireshark is installed
    package { 'wireshark':
      ensure => latest,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }
    
    #Ensure bginfo is installed
    package { 'bginfo':
      ensure => latest,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }
    
    #Ensure sysinternals is installed
    package { 'sysinternals':
      ensure => latest,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }  
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
