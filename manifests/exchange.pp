class profile::exchange(
  $exrole       = hiera('profile::exchange::exrole'),
  $share        = hiera('profile::exchange::share'),
  $version      = hiera('profile::exchange::version', '2010'),
  $servicepack  = hiera('profile::exchange::servicepack', 1)
){
  notify {'Applying profile: exchange':}
  class { 'exchange::prerequisites':
    exrole    => $exrole,
    directory => "${share}${version}\\",
  }
  contain exchange::prerequisites
  
  $filename = $servicepack ? {
    1       => 'en_exchange_server_2010_with_sp1_x64_dvd_587827.iso',
    default => fail('Unknown Exchange service pack')
  }
  
  #Mount the iso
  windows_isos{'Exchange 2010 SP1':
    ensure  => present,
    isopath => "${share}${version}\\${filename}"
  }
  #contain windows_isos
}