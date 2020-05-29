#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

foreach ($item in ".temp", "build", "doc/api", "lib/index.php", "lib/js/coveralls.*", "lib/php", "lib/res", "www") {
	if (Test-Path $item) { Remove-Item $item -Force -Recurse }
}

foreach ($item in Get-ChildItem var -Exclude .gitkeep) {
	Remove-Item $item -Recurse
}
