# Adds Java to the beginning of the PATH environment variable
# since we install it from asdf, the plugin for which will only
# set JAVA_HOME if in a supported shell - and pwsh isn't.

$env:JAVA_HOME = Get-Item "$(asdf which java)" | Get-ItemPropertyValue -Name DirectoryName
