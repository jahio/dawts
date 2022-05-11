# Use oh-my-posh (https://ohmyposh.dev/) for shell prompt
$desired_posh_theme = "plague"

# TODO: Make sure desired theme file exists
$themePath = "$(brew --prefix oh-my-posh)/themes/$desired_posh_theme.omp.json"

oh-my-posh --init --shell pwsh --config $themePath | Invoke-Expression

# Set PSReadline options to show a menu on tab complete
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
