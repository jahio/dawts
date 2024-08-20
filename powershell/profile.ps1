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

# Set current path as an array
$currentPath = $env:PATH -Split ":" | Select-Object -Uniq

# Declare what we want in our $PATH here; we'll filter out duplicates below
# Keep order of precedence in mind here; first binary found wins.
$updatedPath = (
  "$HOME/opt/brew/bin",
  "$HOME/opt/bin",                                    # Personal scripts/symlinks to misc. stuff
  "$HOME/.local/bin",                                 # Stuff installed by pip/pipx
  "$HOME/.cargo/bin",                                 # From cargo, package installer for rust-lang
  "$HOME/.go/bin",                                    # Golang binaries
  "$HOME/.dotnet/tools",                              # .NET Core tools
  "$HOME/opt/brew/opt/openjdk@11/bin",                # OpenJDK 11
  "$HOME/Applications/Pragtical.app/Contents/MacOS/", # Pragtical text editor: https://pragtical.dev/
  "/usr/local/bin",                                   # Common system-level paths for regular and
  "/usr/local/sbin",                                  # superuser programs (*/sbin)
  "/usr/bin",
  "/usr/sbin",
  "/bin",
  "/sbin",
  "/usr/libexec"
) | Select-Object -Uniq

$env:PATH = (($updatedPath + $currentPath) | Select-Object -Uniq) -Join ":"

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
