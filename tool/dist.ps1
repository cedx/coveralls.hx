#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/version.ps1
tool/build.ps1

npm run dist
@("#!/usr/bin/env node") + (Get-Content bin/coveralls.js) | Out-File bin/coveralls.js
if (-not $IsWindows) { chmod +x bin/coveralls.js }

Remove-Item lib/index.php
Get-ChildItem lib/php -Exclude adapter.php, coveralls, tink | Remove-Item -Force -Recurse
Get-ChildItem lib/php/tink -Exclude cli | Remove-Item -Force -Recurse
Get-ChildItem lib/php/tink/cli -Exclude *0.php | Remove-Item -Force -Recurse
