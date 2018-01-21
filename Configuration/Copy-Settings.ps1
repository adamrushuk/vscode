# Copy keyboard shortcuts and settings files
$sourceFiles = '.\User'
$vscodeSettingsfolder = Join-Path -Path $env:APPDATA -ChildPath 'Code\User'
Copy-Item -Path $sourceFiles -Destination $vscodeSettingsfolder -Recurse -Verbose
