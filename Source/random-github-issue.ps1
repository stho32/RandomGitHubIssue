<#

    Get Random GitHub Issue

#>

# This is your username
$user = "stho32"
$organization = "Mahrvengers"

$repositories = @()

$repositories += Invoke-RestMethod -Uri "https://api.github.com/users/$user/repos"
$repositories += Invoke-RestMethod -Uri "https://api.github.com/users/$organization/repos"

# Friendly output
Write-Host ""
Write-Host "Hey there, here are 5 proposals you probably could work on today:"
Write-Host ""

$repositories | Get-Random -Count 5 | % {
    Write-Host "  -" $_.full_name "( open issues: " $_.open_issues ")"
    Write-Host "    URL :" $_.html_url
    Write-Host ""
}