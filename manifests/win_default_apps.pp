class profile::win_default_apps {
  include chocolatey_sw

  # Ensure Notepad++ is installed
  package { 'notepadplusplus.install':
    ensure   => present,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }

  # Ensure wireshark is installed
  package { 'wireshark':
    ensure   => present,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }

  # Ensure sysinternals is installed
  package { 'sysinternals':
    ensure   => present,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
  # Ensure 7zip is installed
  package { '7zip.install':
    ensure   => present,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
  # Ensure Google Chrome is installed
  package { 'GoogleChrome':
    ensure   => present,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
  # Ensure WinDirStat is installed
  package { 'windirstat':
    ensure   => present,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
}