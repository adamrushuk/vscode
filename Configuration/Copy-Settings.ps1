# Copy keyboard shortcuts and settings files
$sourceFiles = 'User'
$vscodeSettingsfolder = Join-Path -Path $env:APPDATA -ChildPath 'Code'
Copy-Item -Path $sourceFiles -Destination $vscodeSettingsfolder -Recurse -Force -Verbose
