class profile::linux::adminuser(
  $username     = heira('profile::linux::adminuser::$username'),
  $adminpass    = heira('profile::linux::adminuser::$adminpass'),
  $group       = heira('profile::linux::adminuser::$group')
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
    shell => "bin/bash"
    }
    
}