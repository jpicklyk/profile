class profile::software_share (
  $name       = hiera("profile::software_share::name"),
  $psprovider = "FileSystem",
  $root       = hiera("profile::software_share::root"),
  $account    = hiera("profile::software_share::account"),
  $key        = hiera("profile::software_share::key")
) {
  $credential = "(New-Object System.Management.Automation.PsCredential(${account}, (ConvertTo-SecureString \'${key}\' -AsPlainText -Force)))"
  exec { 's-drive':
    command   => "New-PSDrive -Name ${name} -PSProvider ${psprovider} -Root ${root} -Credential ${credential} -Persist",
    onlyif    => "if(Test-Path ${name}){exit 1} else {}",
    provider  => powershell,  
  }
}