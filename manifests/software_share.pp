class profile::software_share (
  $drive      = hiera('profile::software_share::drive'),
  $psprovider = hiera('profile::software_share::psprovider','FileSystem'),
  $root       = hiera('profile::software_share::root'),
  $sharename  = hiera('profile::software_share::sharename', 'software'),
  $account    = hiera("profile::software_share::account"),
  $key        = hiera("profile::software_share::key"),
) {
  
  
#  $credential = "(New-Object System.Management.Automation.PsCredential(\'${account}\', (ConvertTo-SecureString \'${key}\' -AsPlainText -Force)))"
#  $command = $kernelversion ? {
#    /^6\.1/ => "\$net = new-object -ComObject WScript.Network; \$net.MapNetworkDrive('${drive}:', '${root}', \$false, '${account}', '${key}')",
#    default => "New-PSDrive -Name ${drive} -PSProvider ${psprovider} -Root ${root} -Credential ${credential} -Persist",
#  }
  $command = "cmdkey /add:${root} /user:${account} /pass:${key};net use ${drive}: '\\\\${root}\\${sharename}'"
  
  exec { 's-drive':
    command   => $command,
    onlyif    => "if(Test-Path ${drive}:){exit 1}",
    provider  => powershell,  
  }
}