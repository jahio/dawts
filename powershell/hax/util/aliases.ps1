# These are just some hax for quick and easy re-use of various commands
# Beats having to type a long list of options over and over again!

# exa: ls replacement (brew install exa)
function ls { eza -lamgh --icons --git --group-directories-first --color-scale-mode gradient --time-style="long-iso" -I ".DS_Store" @Args }
function real-ls { /bin/ls @Args }

# Aliases for git
function gst   { git status @Args }
function ga    { git add @Args    }
function gitp  { git push @Args   } ; Set-Alias -Name gp -Value gitp -Option AllScope -Force
function gd    { git diff @Args   }
function gitc  { git commit @Args } ; Set-Alias -Name gc -Value gitc -Option AllScope -Force

# Redefine 'which' as 'Get-Command'
function which { Get-Command -ShowCommandInfo @Args }
function real-which { /usr/bin/which @Args }

# Redefine less as moar
function less { moar @Args }
function real-less { /usr/bin/less @Args }

# df -> duf
function df { duf -only local -hide-mp "/boot/*,/boot,/home" -output "mountpoint,size,used,avail,usage,type" }
function real-df { /usr/bin/df @Args }
