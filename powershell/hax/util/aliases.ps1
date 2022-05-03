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

# Redefine 'which' as 'Get-Command'
function which { Get-Command @Args }
function rwhich { /usr/bin/which @Args }

# Redefine less as moar
function less { moar @Args }
function rless { /usr/bin/less @Args }

# df -> duf
function df { duf -only local -hide-mp "/boot/*,/boot,/home" -output "mountpoint,size,used,avail,usage,type" }
function rdf { /usr/bin/df @Args }
