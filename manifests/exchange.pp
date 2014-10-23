class profile::exchange(
  $exrole = hiera('profile::exchange::exrole'),
  
){
  
  class { 'exchange::prerequisites':
    roles => $exrole,
  }
  
}