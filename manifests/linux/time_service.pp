class profile::linux::time_service(
  $foldername = hiera('profile::linux::time_service::foldername'),
  $user       = hiera('profile::linux::time_service::user')  
) {
  
  notify {'Applying NTP Service':}
  validate_absolute_path($foldername)
  validate_string($user)
  
  file { $foldername:
    ensure => directory,
    owner => "$user",
    
  }
    
}