If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Remove-Item "License.lic" -Force | Out-Null
    Remove-Item "PowerOrganize.ps1" -Force | Out-Null
    Remove-Item "README.md" -Force | Out-Null
    Write-Host "Done!.."
    Write-Host "Exiting in 5..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!.."
    Write-Host "Exiting in 4..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!.."
    Write-Host "Exiting in 3..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!.."
    Write-Host "Exiting in 2..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!.."
    Write-Host "Exiting in 1..."
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Write-Host "Done!.."
    Write-Host "Exiting in 0..."
    Start-Sleep -Seconds 1
    Remove-Item "Launcher.ps1" -Force | Out-Null
    Exit
}
Write-Host "Installing..."
Set-ExecutionPolicy Unrestricted -Force
Move-Item "License.lic" -Destination "C:\Windows" -Force
Move-Item "PowerOrganize.ps1" -Destination "C:\Windows" -Force
Move-Item "README.md" -Destination "C:\Windows" -Force
Write-Host "Done!.."
$q = Read-Host "Would you like a copy of the code placed on your desktop?(y/n)>"
$l = $q.ToLower()
Switch ($l)
{
    "y*" 
    {
        Write-Host "Copying..."
        $poh = "$env:HOMEPATH\Desktop\PowerOrganize"
        New-Item "$poh" -ItemType Directory -Force
        Copy-Item "License.lic" -Destination "$poh" -Force
        Copy-Item "PowerOrganize.ps1" -Destination "$poh" -Force
        Copy-Item "README.md" -Destination "$poh" -Force
        Write-Host "Done!.."
        Write-Host "Exiting in 5..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 4..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 3..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 2..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 1..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 0..."
        Start-Sleep -Seconds 1
        Remove-Item "Launcher.ps1" -Force | Out-Null
        Exit
    }
    "s*" 
    {
        Write-Host "Copying..."
        $poh = "$env:HOMEPATH\Desktop\PowerOrganize"
        New-Item "$poh" -ItemType Directory -Force
        Copy-Item "License.lic" -Destination "$poh" -Force
        Copy-Item "PowerOrganize.ps1" -Destination "$poh" -Force
        Copy-Item "README.md" -Destination "$poh" -Force
        Write-Host "Done!.."
        Write-Host "Exiting in 5..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 4..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 3..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 2..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 1..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 0..."
        Start-Sleep -Seconds 1
        Remove-Item "Launcher.ps1" -Force | Out-Null
        Exit
    }
    "n*" 
    {
        Write-Host "Done!.."
        Write-Host "Exiting in 5..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 4..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 3..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 2..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 1..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 0..."
        Start-Sleep -Seconds 1
        Remove-Item "Launcher.ps1" -Force | Out-Null
        Exit
    }
    default
    {
        Write-Host "Done!.."
        Write-Host "Exiting in 5..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 4..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 3..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 2..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 1..."
        Start-Sleep -Seconds 1
        Clear-Host
        Write-Host "Done!.."
        Write-Host "Exiting in 0..."
        Start-Sleep -Seconds 1
        Remove-Item "Launcher.ps1" -Force | Out-Null
        Exit
    }
}
