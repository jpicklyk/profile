class profile::linux::time_service()
  {
  
  notify {'Applying NTP Service':}
  contain '::ntp'
        
}