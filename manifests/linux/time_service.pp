class profile::linux::time_service(
  $foldername = hiera('profile::linux::time_service::foldername'),
  $user       = hiera('profile::linux::time_service::user')  
) {
  
  validate_absolute_path($foldername)
  validate_string($user)
  
  file { $foldername:
    ensure => present,
    owner => "$user",
    
  }
    
}