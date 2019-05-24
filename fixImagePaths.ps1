# take in the path to search
[Parameter]
[string]$path

# find a list of files
$fileList = Get-ChildItem -Path $path -Recurse -File -Include *.md
# for each file
$fileList | ForEach-Object -Process {
  $currentFileContents = Get-Content -Path $_
    $currentFileContents -replace '%5C', '\' -replace '-%22', ' "' -replace '%22', '"' | Set-Content -Path $_
  Write-Host $_.FullName
}
