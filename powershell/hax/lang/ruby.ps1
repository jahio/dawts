#!/usr/bin/env pwsh

# PowerShell functions for working with Ruby, rbenv, and related things.

# Set environment variables for working with Ruby (for things like ruby-install, etc.)
# NOTE: Requires $env:PATH to be set *before* running these commands so they can pick up
# `brew`, etc.
#$openssl11 = brew --prefix openssl@1.1
$env:DISABLE_SPRING = $true
#$env:RUBY_CONFIGURE_OPTS = "--with-openssl-dir=$openssl11"

<#
.SYNOPSIS
  TODO
.DESCRIPTION
  TODO
.EXAMPLE
  TODO
#>

function Invoke-rbenv {
  # If rbenv exists as an available command, delegate to it. Otherwise, fall back to system ruby
  # which is installed at /usr/bin/ruby by default on MacOS.
  #$rb = Get-Command 'rbenv'
  #if(($rb -eq $null) -or ($rb.Exists -ne $True)) {
  #  # No rbenv
  #  Write-Error   "rbenv not found; check $profile configuration and PATH. Cannot continue."
  #  Write-Host    $rb -BackgroundColor DarkBlue -ForegroundColor White
  #  return 1
  #}
  # Write-Debug "Found rbenv at $rb"
  # Write-Debug "Args received: $($args.Count)"
  # $args | ForEach-Object { Write-Debug $_.ToString() }
  # Write-Debug "rbenv ruby: $(rbenv version) $(rbenv which ruby)"
  rbenv exec @Args
}

# function irb {
#   Invoke-rbenv irb @Args
# }
#
# function gem {
#   Invoke-rbenv gem @Args
# }
#
# function ruby {
#   Invoke-rbenv ruby @Args
# }
#
# function bundle {
#   Invoke-rbenv bundle @Args
# }
#
# function be {
#   Invoke-rbenv bundle exec @Args
# }
