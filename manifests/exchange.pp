class profile::exchange(
  $exrole = hiera('profile::exchange::exrole'),
  $share  = hiera('profile::exchange::share'),
){
  notify {'Applying profile: exchange':}
  class { 'exchange::prerequisites':
    exrole    => $exrole,
    directory => $share,
  }
  contain exchange::prerequisites
}