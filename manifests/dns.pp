class profile::dns (
  $forwarders     = hiera('profile::dns::forwarders', ['8.8.8.8','8.8.4.4']),
  $zonename  = hiera('windows_ad::domainname'),
  $dynamicupdate  = hiera('profile::dns::dynamicupdate', 2)
){
  
  windows_dns::forwarder {'Google forwarder':
    ensure    => present,
    ipaddress => $forwarders,
  }
  
  windows_dns::zoneconfig {'Azure requirement':
    zonename      => $zonename,
    dynamicupdate => $dynamicupdate,
  }
}