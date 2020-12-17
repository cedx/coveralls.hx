#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe build_doc.hxml
haxelib run dox `
	--define description "Send LCOV and Clover coverage reports to the Coveralls service, in Haxe, JavaScript and PHP." `
	--define source-path "https://git.belin.io/cedx/coveralls.hx/src/branch/main/src" `
	--define themeColor 0xffc105 `
	--define version $version `
	--define website "https://belin.io" `
	--input-path var `
	--output-path docs/api `
	--title "Coveralls.hx" `
	--toplevel-package coveralls

Copy-Item docs/favicon.ico docs/api
