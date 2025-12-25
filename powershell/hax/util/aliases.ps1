# These are just some hax for quick and easy re-use of various commands
# Beats having to type a long list of options over and over again!

# exa: ls replacement (brew install exa)
function ls {
  # First, check if eza is installed and in $PATH. If so, run it. Otherwise, we'll fall back to normal /bin/ls
  if (Get-Command eza -ErrorAction SilentlyContinue) {
    eza -lamgh --icons --git --group-directories-first --color-scale-mode gradient --time-style="long-iso" @Args
  }
  else {
    /bin/ls -Flac --color @Args
  }

  # If there's a .DS_Store file - something MacOS is notoroius for littering the filesystem with - destroy it
  # This comes at the end so that if there's some unexpected error, Write-Debug is at the BOTTOM of the output,
  # thus ensuring the user sees it.
  Remove-DSStore
}

# Fallback for the original ls
function real-ls { /bin/ls @Args }

# This is a function to clean up stale .DS_Store files in the $PWD if they exist.
function Remove-DSStore {
  $bad = ".DS_Store"
  $file = Join-Path -Path $PWD -ChildPath $bad

  if (Test-Path -LiteralPath $file -PathType Leaf) {
    # Save original debug preferences for later restoration, then set to "Continue" so
    # the user can see the error message.
    $originalDebugPrefs = $DebugPreference
    $DebugPreference = "Continue"

    try {
      Remove-Item -LiteralPath $file -Force -ErrorAction Stop
    }
    catch {
      Write-Debug "Failed to remove ${bad}: $_"
    }

    # Restore debug preference to what it was now that we've done try/catch
    $DebugPreference = $originalDebugPrefs
  }
}

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
function less {
  if (Get-Command moor -ErrorAction SilentlyContinue) {
    moor @Args
  }
  else {
    /usr/bin/less -r @Args
  }
}

function real-less { /usr/bin/less @Args }

# df -> duf
function df {
  # Check for presence of 'duf' first, falling back to 'df' if not available
  if (Get-Command duf -ErrorAction SilentlyContinue) {
    duf -only local -hide-mp "/boot/*,/boot,/home" -output "mountpoint,size,used,avail,usage,type"
  }
  else {
    /bin/df -HIY @Args
  }
}
function real-df { /bin/df -HIY @Args }
