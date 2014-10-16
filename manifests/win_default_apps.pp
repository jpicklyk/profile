class profile::win_default_apps {
  include chocolatey_sw

  # Ensure Notepad++ is installed
  package { 'notepadplusplus.install':
    ensure   => latest,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }

  # Ensure wireshark is installed
  package { 'wireshark':
    ensure   => latest,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }

  # Ensure bginfo is installed
  package { 'bginfo':
    ensure   => latest,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }

  # Ensure sysinternals is installed
  package { 'sysinternals':
    ensure   => latest,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
  # Ensure 7zip is installed
  package { '7zip.install':
    ensure   => latest,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
  # Ensure Google Chrome is installed
  package { 'GoogleChrome':
    ensure   => latest,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
  # Ensure WinDirStat is installed
  package { 'windirstat':
    ensure   => latest,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw']
  }
  
}