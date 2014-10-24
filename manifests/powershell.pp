class profile::powershell(
  $filename = hiera('profile::powershell::filename', 'Windows6.1-KB2819745-x64-MultiPkg.msu'),
  $share    = hiera('profile::powershell::share')
){
  if($kernelversion =~ /^6\.1/) {
    package { 'Microsoft Windows Management Framework 4.0 (KB2819745)':
      ensure => 'installed',
      source => "${share}${filename}",    
      install_options => ['/quiet','/norestart'],
    } 
  }
}