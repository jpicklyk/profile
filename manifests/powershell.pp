class profile::powershell(
  $filename = hiera('profile::powershell::filename', 'Windows6.1-KB2819745-x64-MultiPkg.msu'),
  $share    = hiera('profile::powershell::share')
){
  if($kernelversion =~ /^6\.1/) {
    notify{'Applying profile: powershell':}
    ### MSU file are not supported with package yet ###
#    package { 'Microsoft Windows Management Framework 4.0 (KB2819745)':
#      ensure => 'installed',
#      source => "${share}${filename}",    
#      install_options => ['/quiet','/norestart'],
#    }
    reboot{'before powershell':
      when  => pending,
    }
    
    exec {'powershell4':
      command => "c:\\windows\\system32\\wusa.exe ${share}${filename} /quiet /norestart",
      onlyif  => "c:\\windows\\system32\\WindowsPowershell\\v1.0\\powershell.exe -executionpolicy remotesigned if(\$PSVersionTable -and (\$PSVersionTable.PSVersion -ge [Version]'4.0')){exit 1}",
      returns => [0,3010],
      require => Reboot['before powershell']
    }
    
    reboot{'after powershell':
      subscribe => Exec['powershell4']
    } 
  }
}