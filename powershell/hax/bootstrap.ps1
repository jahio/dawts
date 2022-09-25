#
# hax/bootstrap.ps1
#

# Set environment for Homebrew
$env:HOMEBREW_CASK_OPTS = "--appdir=$HOME/Apps"
$env:HOMEBREW_LOGS = "$HOME/.logs/brew.sh"
$env:HOMEBREW_BOOTSNAP = 1
$env:HOMEBREW_COLOR = 1
$env:HOMEBREW_NO_ANALYTICS = 1

# TODO: Check for existence of $HOME/Apps and $HOME/.logs and create if they don't exist

# Set Up Homebrew
## Default to "$HOME/.brew", then override if on Linux
$brew_location = "$HOME/opt/brew"

if ($IsLinux) {
  $brew_location = "/home/linuxbrew/.linuxbrew"
}

"$brew_location/bin/brew shellenv" | Invoke-Expression | Invoke-Expression
# The double-Invoke is necessary because the dot throws off pwsh for some reason,
# so we have to take the path as a string, pass that to the first invoke to get it to run
# the command itself, then pass the *OUTPUT* from that command to the second Invoke.
# Convoluted, but it works.

# Declare the rest of $PATH properly
# TODO: Get current path, turn it into an array, prepend the below, then filter out duplicates
# Set Paths that aren't already covered by Homebrew
$updatedPath = (
  "$HOME/.bin",          # Personal scripts/symlinks to misc. stuff
  "$HOME/.local/bin",    # Stuff installed by pip/pipx
  "$HOME/.cargo/bin",    # From cargo, package installer for rust-lang
  "$HOME/.go/bin",       # Golang binaries
  "/usr/local/bin",      # Common system-level paths for regular and
  "/usr/local/sbin",     # superuser programs (*/sbin)
  "/usr/bin",
  "/usr/sbin",
  "/bin",
  "/sbin",
  "/usr/libexec"
) | Select -Uniq

$env:PATH = ($updatedPath -Join ":") + $env:PATH
