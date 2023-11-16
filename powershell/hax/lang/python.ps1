#!/usr/bin/env pwsh

# python.ps1
# PowerShell functions for working with Python through pyenv
# HIGHLY EXPERIMENTAL. As I first write this, I'm very new to Python, and to pyenv.
# Not all features of pyenv are going to work (particularly autocompletion), but
# having made rbenv work similarly, and since pyenv takes its cues from rbenv
# anyway, and given its environment-variable + shims based approach, this seems
# like a manageable thing to at least take a stab at.

#
# Begin by setting some necessary environment variables. We'll assume the
# following:
#
#   Environment:     MacOS / PowerShell Core
#   pyenv location:  $(brew --prefix pyenv)/bin/pyenv
#                    Typically I install Homebrew in $HOME/opt/brew
#   PYENV_ROOT:      $HOME/.pyenv
#
$env:PYENV_ROOT = "$HOME/.pyenv"
$pyenv_loc = "$(brew --prefix pyenv)/bin/pyenv"

function Invoke-pyenv {
  pyenv exec @Args
}

# function irb {
#   Invoke-rbenv irb @Args
# }

function pip {
  Invoke-pyenv pip @Args
}

function pip3 {
  Invoke-pyenv pip3 @Args
}

function python {
  Invoke-pyenv python @Args
}

function python3 {
  Invoke-pyenv python3 @Args
}

function hatch {
  Invoke-pyenv hatch @Args
}

# function be {
#   Invoke-rbenv bundle exec @Args
# }

