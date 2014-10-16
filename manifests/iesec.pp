class profile::iesec (
  $admin = hiera('profile::iesec::admin', false),
  $users  = hiera('profile::iesec::users', false)){
    
    validate_bool($admin)
    validate_bool($users)
        
    class {'::iesec':
      admin_enabled => $admin,
      users_enabled  => $users,
    }
}