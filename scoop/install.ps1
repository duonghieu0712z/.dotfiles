$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir
$Manifest = . (Join-Path $ScriptDir "Scoopfile.ps1")

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
  Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

$ScoopShimDir = Join-Path $HOME "scoop\shims"

if ((Test-Path $ScoopShimDir) -and ($env:PATH -notlike "*$ScoopShimDir*")) {
  $env:PATH = "$ScoopShimDir;$env:PATH"
}

$InstalledBuckets = @(scoop bucket list | ForEach-Object { ($_ -split "\s+")[0] } | Where-Object { $_ })

foreach ($Bucket in $Manifest.Buckets) {
  if ($InstalledBuckets -notcontains $Bucket) {
    scoop bucket add $Bucket
  }
}

$Packages = @()
$Packages += $Manifest.DeveloperTools
$Packages += $Manifest.ShellTools
$Packages += $Manifest.Runtimes
$Packages += $Manifest.DeveloperApps
$Packages += $Manifest.Browsers
$Packages += $Manifest.ProductivityApps
$Packages += $Manifest.AiApps
$Packages += $Manifest.CommunicationApps
$Packages += $Manifest.RemoteTools
$Packages += $Manifest.Fonts

$Packages | ForEach-Object { scoop install $_ }

foreach ($Module in $Manifest.PowerShellModules) {
  if (-not (Get-Module -ListAvailable -Name $Module)) {
    Install-Module $Module -Scope CurrentUser -Force -AllowClobber
  }
}

New-Item -ItemType Directory -Force -Path (Split-Path $PROFILE) | Out-Null
Copy-Item (Join-Path $RepoRoot "powershell/Microsoft.PowerShell_profile.ps1") $PROFILE -Force

New-Item -ItemType Directory -Force -Path "$HOME\.oh-my-posh" | Out-Null
Copy-Item (Join-Path $RepoRoot "oh-my-posh/mytheme.omp.json") "$HOME\.oh-my-posh\mytheme.omp.json" -Force

Copy-Item (Join-Path $RepoRoot "git/.gitconfig") "$HOME\.gitconfig" -Force

$TerminalSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$TerminalSettingsDir = Split-Path $TerminalSettingsPath

if (Test-Path $TerminalSettingsDir) {
  Copy-Item (Join-Path $RepoRoot "powershell/settings.json") $TerminalSettingsPath -Force
}
