class profile::linux::adminuser(
  $username     = hiera('profile::linux::adminuser::$username'),
  $adminpass    = hiera('profile::linux::adminuser::$adminpass'),
  $group       = hiera('profile::linux::adminuser::$group')
){
  
  validate_string($username)
  validate_string($group)
  
  notify {'creating the admin group!':}
  
  group {$group:
    ensure => present 
    }
         
  notify {'creating the admin user!':}
  
  user{ $username:
    ensure => present,
    groups => $group,
    shell => "/bin/bash"
    }
    
}