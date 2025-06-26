Write-Host "PSDevOps: DockerAllDown`n" -ForegroundColor Red
$running = "mycontainers.txt"
Invoke-Expression "& docker ps --format 'json'" | ConvertFrom-Json | Select-Object -ExpandProperty ID | Out-File $running utf8
$idlist = Get-Content $running -Encoding UTF8
foreach ($id in $idlist){
    ### Write-Host -ForegroundColor Red "Stopping container: $id...`n"
    Invoke-Expression "& docker stop $id"
}
Remove-Item "mycontainers.txt"
Write-Host "All containers stopped.`n" -ForegroundColor Red
