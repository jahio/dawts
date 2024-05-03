#
# Update-PowerShell
#
# Attempts to update PowerShell via GitHub releases by pulling down the latest tarball and
# decompressing into the installation directory, then symlinking. The layout is like this:
#
# Installation path: $HOME/opt/pwsh/$VERSION
# Symlink that to: $HOME/opt/pwsh/current
#
# ...and that symlink is in $PATH so 'pwsh' just picks up whatever is in 'current' and boom,
# you have the latest installed PowerShell.
#
# This installation is done via GitHub TARBALL method, no installers. We do this by invoking a
# REST call to the GitHub API to the below URL, finding the tag name, then building the OS X
# tgz URL from that.
#

function Update-PowerShell {
  #
  # This is only working for MacOS right now, bail out if not on Mac
  if(!$IsMacOS) {
    Write-Error "This only works on MacOS right now, you'll have to do it manually otherwise. Sorry!"
    return
  }

  #
  # Start by defining where things go, current execution platform, version, etc.
  # Examples (not necessarily up to date!) follow in comments
  #
  $CurrentVersion = $PSVersionTable.PSVersion.ToString()                                          # 7.2.7
  $InstallationPath = $PSHOME.Replace($PSVersionTable.PSVersion.ToString(), "").TrimEnd("/", " ") # /Users/jah/opt/pwsh
  $SymlinkPath = "$InstallationPath/current"                                                         # /Users/jah/opt/pwsh/current

  #
  # Discover what the latest version actually is, massage the string stuff to get the 'v' piece outta there
  #
  $LatestRelease = Invoke-RestMethod 'https://api.github.com/repos/powershell/powershell/releases/latest'
  $LatestVersion = $LatestRelease.tag_name.Replace("v", "") # v7.3.0 -> 7.3.0
  if($CurrentVersion -eq $LatestVersion) {
    Write-Error "You're already running the latest version! $LatestVersion"
    return
  }

  #
  # Are we on x86_64 or arm64?
  #
  $is_silicon = ('sysctl -ni hw.optional.arm64' | Invoke-Expression) # 1 is arm64, anything else is x86_64
  if($is_silicon -eq 1) {
    $Arch = "arm64"
  } else {
    $Arch = "x64"
  }


  #
  # Construct the URL to scan for based on platform, also the hashes url
  #
  $DownloadURL = "https://github.com/PowerShell/PowerShell/releases/download/v$LatestVersion/powershell-$LatestVersion-osx-$Arch.tar.gz"
  # $HashesURL = "https://github.com/PowerShell/PowerShell/releases/download/v$LatestVersion/hashes.sha256"

  #
  # Find that URL within the assets array
  #
  # $Asset = $LatestRelease.assets | Where-Object { $_.browser_download_url -eq $DownloadURL }

  #
  # Fetch that file and stuff it in /tmp
  #
  $TempPath = "/tmp/pwsh-$LatestVersion.tar.gz"

  #
  # Create destination directory and unpack, then remove existing 'current' symlink if there, and then re-create
  # that symlink pointing to new dest directory
  #
  New-Item -ItemType Directory -Path $InstallationPath -Name $LatestVersion
  Invoke-WebRequest -Uri $DownloadURL -OutFile $TempPath
  tar --directory "$InstallationPath/$LatestVersion" -zxvf $TempPath
  New-Item -ItemType SymbolicLink -Path $SymlinkPath -Target "$InstallationPath/$LatestVersion" -Force
  chmod +x "$InstallationPath/$LatestVersion/pwsh"

  #
  # TODO: Check SHASUM for the download against known shasum file for validity
  #
}
