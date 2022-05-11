#!/usr/bin/env pwsh


<# -- DISABLED as of 2022-05-10: This is hacky and bad and doesn't work anyway, kill it

$DebugPreference = 'SilentlyContinue'
$ErrorView = 'NormalView'

# Misc. debug functions
function hax {
  if($DebugPreference -eq 'Continue') {
    $DebugPreference = 'SilentlyContinue'
  } else {
    $DebugPreference = 'Continue'
  }
  if($ErrorView -ne 'DetailedView') {
    $ErrorView = 'DetailedView'
  } else {
    $ErrorView = 'NormalView'
  }
  Write-Host "DebugPreference set to $DebugPreference"
  Write-Host "ErrorView set to $ErrorView"
}

# TODO: This doesn't work right now. Not sure why, need to fix it so I can
# toggle hax on and off (also print the status of the stuff)

# Export-ModuleMember -Function * -Alias * -Variable *

#>