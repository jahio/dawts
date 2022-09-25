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


# Declare the rest of $PATH properly
# TODO: Get current path, turn it into an array, prepend the below, then filter out duplicates
# Set Paths that aren't already covered by Homebrew
$updatedPath = (
  "$HOME/opt/brew/bin",
  "$HOME/.bin",          # Personal scripts/symlinks to misc. stuff
  "$HOME/.local/bin",    # Stuff installed by pip/pipx
  "$HOME/.cargo/bin",    # From cargo, package installer for rust-lang
  "$HOME/.go/bin",       # Golang binaries
  "/usr/local/bin",      # Common system-level paths for regular and
  "/usr/local/sbin",     # superuser programs (*/sbin)
  "/usr/bin",
  "/usr/sbin",
  "/bin",
  "/sbin",
  "/usr/libexec"
) | Select -Uniq

$env:PATH = ($updatedPath -Join ":") + $env:PATH
brew shellenv | Invoke-Expression

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
$env:EDITOR=(which nano).Definition
$env:VISUAL=(which nano).Definition
$env:PAGER=(which moar).Definition

# Put something pretty on the screen
neofetch --disable packages shell theme de wm icons --cpu_temp C --speed_shorthand on --bold on --underline on --memory_percent on --ascii_distro ($neofetch_ascii_options | Get-Random)
