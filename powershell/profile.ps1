#!/usr/bin/env pwsh

#
# Personal PowerShell Core Profile (use cases: MacOS, Linux)
#

#
# Start by disabling PowerShell Telemetry.
#
$env:POWERSHELL_TELEMETRY_OPTOUT = $true

#
# DEBUG
#
# $DebugPreference = "Continue"
# $ErrorView = "DetailedView"
#

#
# Bootstrap process:
#   1. Declare where the pseudo-module is ("hax")
#   2. Run/Load $hax/bootstrap.ps1
#
$hax = "$HOME/.config/powershell/hax"
. "$hax/bootstrap.ps1"

#
# That was just the warm-up; now we load all the pseudo-modules *under* hax/
# These should be loadable in any order whatsoever. Anything requiring specificity
# of load order should be handled by the bootstrap procedure above.
#

Get-ChildItem $hax/* -Include *.ps1 -Recurse -FollowSymlink | ForEach-Object -Process {
  Write-Debug "Dot-Loading: $_ ..." # -ForegroundColor DarkGray
  . $_.FullName
}

# Editor, Visual, Pager
$env:EDITOR=(which nvim)
$env:VISUAL=(which nvim)
$env:PAGER=(which moar)

# Put something pretty on the screen
neofetch --clean ; neofetch --disable gpu packages resolution de wm terminal --cpu_temp C