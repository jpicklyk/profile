class profile::active_directory {
  class { '::windows_ad':
    install                => present,
    installmanagementtools => true,
    restart                => true,
    installflag            => true,
    configure              => present,
    configureflag          => true,
    domain                 => 'forest',
    domainname             => 'gestest.net',
    netbiosdomainname      => 'gestest',
    domainlevel            => '4',
    forestlevel            => '4',
    databasepath           => 'c:\\windows\\ntds',
    logpath                => 'c:\\windows\\ntds',
    sysvolpath             => 'c:\\windows\\sysvol',
    installtype            => 'domain',
    dsrmpassword           => 'password',
    installdns             => 'yes',
    localadminpassword     => 'password',
  }
}