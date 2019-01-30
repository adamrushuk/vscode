#Requires -RunAsAdministrator

# Install Git
# Vars
$gitInfPath = "$PSScriptRoot\GitConfig.ini"
$gitLogPath = "$PSScriptRoot\GitInstall.log"
$vscodeLogPath = "$PSScriptRoot\VSCodeInstall.log"

# Change into base directory
Set-Location $PSScriptRoot

# git Git-2.12.2.2-64-bit.exe /SAVEINF="C:\Users\arush\Downloads\GitConfig.inf"
$gitCmdPath = (Resolve-Path -Path 'Git-*-64-bit.exe').Path
$gitArguments = @"
/SILENT /NOCANCEL /CLOSEAPPLICATIONS /LOG="$gitLogPath" /LOADINF="$gitInfPath"
"@

$taskMessage = "Installing Git from [$gitCmdPath] using Arguments [$gitArguments]"
Write-Host "`nSTARTED: $taskMessage..." -ForegroundColor 'Yellow'
try {
    Start-Process -FilePath $gitCmdPath -ArgumentList $gitArguments -Wait -Verbose

    # POST Installation Tasks
    # Add "C:\Program Files\Git\usr\bin" to Path Variable (also "C:\Program Files\Git\bin" should be there)
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Git\usr\bin", "Machine") # Run as admin
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Git\bin", "Machine") # Run as admin
}
catch {
    Write-Error "ERROR: $taskMessage." -ErrorAction 'Continue'
    throw $_
}
Write-Host "FINISHED: $taskMessage." -ForegroundColor 'Green'


# Install VSCode
$vsCodeInstallerPath = (Resolve-Path -Path 'VSCode*Setup*.exe').Path

# Install with the context menu, file association, and add to path options (and don't run code after install):
$vsCodeInstallerArguments = "/verysilent /suppressmsgboxes /mergetasks=`"!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath`" /log=`"$vscodeLogPath`""

$taskMessage = "Installing Visual Studio Code from [$vsCodeInstallerPath] using Arguments [$vsCodeInstallerArguments]"
Write-Host "`nSTARTED: $taskMessage..." -ForegroundColor 'Yellow'
try {
    Start-Process $vsCodeInstallerPath -ArgumentList $vsCodeInstallerArguments -Wait -Verbose
}
catch {
    Write-Error "ERROR: $taskMessage." -ErrorAction 'Continue'
    throw $_
}
Write-Host "FINISHED: $taskMessage." -ForegroundColor 'Green'


# Reboot
Write-Host "`nThe Computer needs to reboot before Step2. Press Enter to reboot or CTRL+C to cancel..." -ForegroundColor 'Cyan'
Pause
Restart-Computer -Confirm:$false
