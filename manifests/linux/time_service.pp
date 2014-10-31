class profile::linux::time_service()
  {
  
  debug('Applying NTP Service')
  contain '::ntp'
        
}