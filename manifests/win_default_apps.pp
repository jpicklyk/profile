class profile::win_default_apps(
    $applications = ["notepadplusplus.install","wireshark", "sysinternals","7zip.install","GoogleChrome","windirstat"]
  ) {
    
  include chocolatey_sw
  
  package { $applications:
    ensure   => present,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw'],
  }
  
  reboot { 'win_default_apps::after':
    subscribe => Package['PowerShell'],
  }

}