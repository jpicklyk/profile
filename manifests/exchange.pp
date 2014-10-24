class profile::exchange(
  $exrole = hiera('profile::exchange::exrole'),
  
){
  notify {'Applying profile: exchange':}
  class { 'exchange::prerequisites':
    exrole => $exrole,
  }
  
}