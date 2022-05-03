# These are just some hax for quick and easy re-use of various commands
# Beats having to type a long list of options over and over again!

# Alias 'ls' to exa (installed via brew install exa)
function ls { exa -alhx --git --icons --group-directories-first @Args }

# Aliases for git
function gst   { git status @Args }
function ga    { git add @Args    }
function gitp  { git push @Args   } ; Set-Alias -Name gp -Value gitp -Option AllScope -Force
function gd    { git diff @Args   }
function gitc  { git commit @Args } ; Set-Alias -Name gc -Value gitc -Option AllScope -Force

# What ports are listening? May be incomplete, recommend external nmap scan
# function ports { lsof -i -n -P | grep LISTEN }

# Get-Command
function gcomm { Get-Command @Args } ; Set-Alias -Name gcom -Value gcomm -Option AllScope -Force
