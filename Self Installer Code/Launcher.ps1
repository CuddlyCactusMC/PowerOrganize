function Do-Copy
{
        Write-Host "Copying..."
        $poh = "$env:HOMEPATH\Desktop\PowerOrganize"
        New-Item "$poh" -ItemType Directory -Force
        Move-Item "License.lic" -Destination "$poh" -Force
        Move-Item "PowerOrganize.ps1" -Destination "$poh" -Force
        Move-Item "README.md" -Destination "$poh" -Force
        Move-Item "Launcher.ps1" -Destination "$poh" -Force
        Move-Item "Pre-Launcher.bat" -Destination "$poh" -Force
}
Function Do-Exit
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
        Remove-Item "License.lic" -Destination "$poh" -Force | Out-Null
        Remove-Item "PowerOrganize.ps1" -Destination "$poh" -Force | Out-Null
        Remove-Item "README.md" -Destination "$poh" -Force | Out-Null
        Remove-Item "Launcher.ps1" -Force | Out-Null
        Remove-Item "Pre-Launcher.ps1" -Force | Out-Null
        Exit
}
Function Do-ErrorExit
{
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
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this installer!`nPlease re-run this installer as an Administrator!"
    Write-Host "Removing Temporary Files..."
    Remove-Item "License.lic" -Force | Out-Null
    Remove-Item "PowerOrganize.ps1" -Force | Out-Null
    Remove-Item "README.md" -Force | Out-Null
    Remove-Item "Pre-Launcher.bat" -Force | Out-Null
    Do-ErrorExit
}
Write-Host "Installing..."
Set-ExecutionPolicy Unrestricted -Force
Copy-Item "License.lic" -Destination "C:\Windows" -Force
Copy-Item "PowerOrganize.ps1" -Destination "C:\Windows" -Force
Copy-Item "README.md" -Destination "C:\Windows" -Force
Write-Host "Done!.."
$q = Read-Host "Would you like a copy of the code placed on your desktop?(y/n)>"
$l = $q.ToLower()
Switch ($l)
{
    y
    {
        Do-Copy
        Do-Exit
    }
    s
    {
        Do-Copy
        Do-Exit
    }
    n
    {
        Do-Exit
    }
    default
    {
        Do-Exit
    }
}
