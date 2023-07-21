# Use oh-my-posh (https://ohmyposh.dev/) for shell prompt

function Get-PoshTheme($themeName) {
  # TODO: Make this look for the .toml, .yml and .yaml equivalents too
  $themePath = "$(brew --prefix oh-my-posh)/themes/$themeName.omp.json"
  if (Test-Path $themePath) {
      return $themePath
  }
  else {
      Write-Host "Theme $themeName not found"
      return $null
  }
}

function Set-PoshTheme($desired_posh_theme) {
  oh-my-posh --init --shell pwsh --config "$(Get-PoshTheme($desired_posh_theme))" | Invoke-Expression
}
# Set PSReadline options to show a menu on tab complete
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# Trigger the theme to be set
Set-PoshTheme("tonybaloney")
# Set-PoshTheme("bubbles")
# Set-PoshTheme("fish")
# Set-PoshTheme("craver")
# Set-PoshTheme("jblab_2021")
# Set-PoshTheme("multiverse-neon")
# Set-PoshTheme("sonicboom_dark")
# Set-PoshTheme("iterm2")