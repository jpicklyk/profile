class profile::win_default_apps(
    $applications = ["notepadplusplus.install","wireshark", "sysinternals","7zip.install","GoogleChrome","windirstat"]
  ) {
    
  include chocolatey_sw
  notify {'Applying profile: win_default_apps':}
  package { $applications:
    ensure   => installed,
    provider => 'chocolatey',
    require  => Class['chocolatey_sw'],
  }
  
  if($kernelversion =~ /^6\.0|^6\.1/) {
    #Update powershell to version 4
    package { 'PowerShell':
      ensure    => installed,
      provider  => 'chocolatey',
      require   => Class['chocolatey_sw'],
    }
    reboot { 'win_default_apps::after':
      subscribe => Package['PowerShell'],
    }
  
  }

}