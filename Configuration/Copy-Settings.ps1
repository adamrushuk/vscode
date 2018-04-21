# Copy keyboard shortcuts and settings files
$sourceFilesPath = Join-Path -Path $PSScriptRoot -ChildPath 'User'
$vscodeSettingsfolder = Join-Path -Path $env:APPDATA -ChildPath 'Code'
Copy-Item -Path $sourceFilesPath -Destination $vscodeSettingsfolder -Recurse -Force -Verbose
