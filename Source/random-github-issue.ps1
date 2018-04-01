<#

    Get Random GitHub Issue

#>

function Get-GitHub-Repositories
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $user
    )

    $result = Invoke-RestMethod -Uri "https://api.github.com/users/$user/repos"
    return $result
}

function Test-RandomGitHubIssue
{
    [CmdletBinding()]
    Param()

    $repositories = @()

    $repositories += Get-GitHub-Repositories "stho32"
    $repositories += Get-GitHub-Repositories "Mahrvengers"
    
    # Friendly output
    Write-Host ""
    Write-Host "Hey there, here are 5 proposals you probably could work on today:"
    Write-Host ""

    $repositories | Get-Random -Count 5 | % {
        Write-Host "  -" $_.full_name "( open issues: " $_.open_issues ")"
        Write-Host "    URL :" $_.html_url
        Write-Host ""
    }
}

# Get-GitHub-Repositories "stho32"
# Test-RandomGitHubIssue