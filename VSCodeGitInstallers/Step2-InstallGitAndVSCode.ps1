# Install VSCode Extensions, and Git configuration

# Change into base directory
Set-Location $PSScriptRoot

# You can also install using the VS Code --install-extension command line switch providing the path to the .vsix file.
# code --install-extension myextension.vsix
Write-Host "`nSTARTED: Installing VS Code extensions..." -ForegroundColor 'Yellow'

$vsCodeExtensionPath = (Resolve-Path -Path 'VSCode-Extensions').Path
$vsCodeExtensionPaths = Get-ChildItem $vsCodeExtensionPath
$codeCmdPath = Join-Path -Path $env:ProgramFiles -ChildPath 'Microsoft VS Code\bin\code.cmd'

foreach ($vsCodeExtensionPath in $vsCodeExtensionPaths.FullName) {
    Write-Host "Installing extension $vsCodeExtensionPath..." -ForegroundColor 'Gray'
    & $codeCmdPath --install-extension $vsCodeExtensionPath 2>&1 >> $null
}

Write-Host "FINISHED: Installing VS Code extensions." -ForegroundColor 'Green'


# Configure global Git settings
Write-Host "`nSTARTED: Final Git configuration..." -ForegroundColor 'Yellow'
$email = Read-Host -Prompt 'Enter your email address, eg. adam.rush@domain.com'
$name = Read-Host -Prompt 'Enter your name, eg. Adam Rush'
& git config --global user.email $email
& git config --global user.name $name

Write-Host "`n=========`nFINISHED: VS Code and Git configuration is now complete.`n=========" -ForegroundColor 'Green'
