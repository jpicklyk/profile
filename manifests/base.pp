class profile::base {
  if $operatingsystem == 'Windows' {
    include windows_puppet
    include chocolatey_sw
    
    #Ensure we have powershell4 installed
    package { 'powershell':
      ensure => present,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }
    
    #Ensure Notepad++ is installed
    package { 'notepadplusplus':
      ensure => present,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }
    
    #Ensure Wireshark is installed
    package { 'wireshark':
      ensure => present,
      provider => 'chocolatey',
      require => Class['chocolatey_sw']
    }
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}