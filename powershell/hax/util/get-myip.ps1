# Get-MyIP
#
# Uses Invoke-WebRequest to fetch your IP from ipinfo.io.
# TODO:
#  - Add -Backend: use $Backend instead of Invoke-WebRequest (e.g. /path/to/curl)
#  - Add -Service: Use $Service instead of ipinfo.io
#    - Add a way to pass auth credentials to -Service
#    - First iteration: disallow use of both backend and service if service has credentials, too complex
#

function Get-MyIP {
  $rawIP = Invoke-WebRequest 'http://ipinfo.io' -ContentType 'application/json' -Method Get -DisableKeepAlive -Headers @{'Accept' = 'application/json'}
  $MyIP = $rawIP.Content | ConvertFrom-Json | Select-Object -ExcludeProperty readme
  $MyIP
}