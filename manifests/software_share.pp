class profile::software_share (
  $drive      = hiera('profile::software_share::drive'),
  $psprovider = hiera('profile::software_share::psprovider','FileSystem'),
  $root       = hiera('profile::software_share::root'),
  $account    = hiera("profile::software_share::account"),
  $key        = hiera("profile::software_share::key"),
) {
  require profile::win_default_apps
  
  $credential = "(New-Object System.Management.Automation.PsCredential(\'${account}\', (ConvertTo-SecureString \'${key}\' -AsPlainText -Force)))"
  exec { 's-drive':
    command   => "New-PSDrive -Name ${drive} -PSProvider ${psprovider} -Root ${root} -Credential ${credential} -Persist",
    onlyif    => "if(Test-Path ${drive}:){exit 1} else {}",
    provider  => powershell,  
  }
}