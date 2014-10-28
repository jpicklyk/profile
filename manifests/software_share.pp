class profile::software_share (
  $drive      = hiera('profile::software_share::drive'),
  $psprovider = hiera('profile::software_share::psprovider','FileSystem'),
  $root       = hiera('profile::software_share::root'),
  $sharename  = hiera('profile::software_share::sharename', 'software'),
  $account    = hiera("profile::software_share::account"),
  $key        = hiera("profile::software_share::key"),
) {
  
  
  exec {'Save Creds':
    command   => "cmdkey /add:${root} /user:${account} /pass:${key}",
    unless    => "if( ((cmdkey.exe /list | select-string '${root}') -replace \".*[:=]\" -replace \"\s\") -contains '${root}' ){exit 1}",
    provider  => powershell,
  } ->
  exec { 's-drive':
    command   => "net use ${drive}: '\\\\${root}\\${sharename}'",
    onlyif    => "if(Test-Path ${drive}:){exit 1}",
    provider  => powershell,  
  }
}