If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Remove-Item "License.lic" -Force | Out-Null
    Remove-Item "PowerOrganize.ps1" -Force | Out-Null
    Remove-Item "README.md" -Force | Out-Null
    Write-Host "Done!"
    Write-Host "Exiting in 5..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!"
    Write-Host "Exiting in 4..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!"
    Write-Host "Exiting in 3..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!"
    Write-Host "Exiting in 2..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!"
    Write-Host "Exiting in 1..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!"
    Write-Host "Exiting in 0..."
    Start-Sleep -Seconds 1
    Exit
    Break
}
