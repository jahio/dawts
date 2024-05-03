#!/usr/bin/env pwsh

#
# Miscellaneous environment variables
# NOTE: If order of operations is important to execution of other things in
# 'hax', set the variable in question elsewhere.
#
# EXECUTION ORDER IS NOT GUARANTEED.
#

# Eza (brew install eza) padding for icon display
$env:EZA_ICON_SPACING = 2

# For dotnet core
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1
# export DOTNET_ROOT="/Users/jah/opt/brew/opt/dotnet/libexec"
$env:DOTNET_ROOT = "$(brew --prefix dotnet)/libexec"