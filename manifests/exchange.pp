class profile::exchange(
  $exrole       = hiera('profile::exchange::exrole'),
  $share        = hiera('profile::exchange::share'),
  $version      = hiera('profile::exchange::version', '2010'),
  $servicepack  = hiera('profile::exchange::servicepack', 1),
  $orgname      = hiera('profile::exchange::orgname', 'Test Organization')
){
  notify {'Applying profile: exchange':}
  contain exchange::prerequisites
  contain exchange::install
  
  $sp = $servicepack ? {
    1       => 'sp1',
    default => fail('Unknown Exchange service pack')
  }
  
  
  class { 'exchange::prerequisites':
    exrole    => $exrole,
    directory => "${share}${version}\\",
  } ->
    
  class {'exchange::install':
    exrole    => $exrole,
    path      => "${share}${version}\\${sp}\\",
    orgname   => $orgname,
  }
    
  
}