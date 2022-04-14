$cpath=(Get-Location).Path+'\lib'

Write-Host $cpath
$params = @{
    Path = $cpath
    NuGetApiKey = '????'
}
Publish-Module @params