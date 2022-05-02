$cpath=(Get-Location).Path+'\PowerPoopizer'

Write-Host $cpath
$params = @{
    Path = $cpath
    NuGetApiKey = '???'
}
Publish-Module @params