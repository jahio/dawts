# Automatic Variables
# Makes $__ hold contents of previous output
# Note: We use double underscore (__) so as not to accidentally interfere with
# the $_ variable in things like ... | Select-Object {$_.Name -eq "foo" }

function Out-Default { $input | Tee-Object -Variable Global:__ | Microsoft.PowerShell.Core\Out-Default }
