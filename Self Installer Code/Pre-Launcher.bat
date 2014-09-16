copy "%0\License.lic" "%HOMEDRIVE%%HOMEPATH%\"
copy "%0\PowerOrganize.ps1" "%HOMEDRIVE%%HOMEPATH%\"
copy "%0\README.md" "%HOMEDRIVE%%HOMEPATH%\"
copy "%0\Launcher.ps1" "%HOMEDRIVE%%HOMEPATH%\"
copy "%0\Pre-Launcher.bat" "%HOMEDRIVE%%HOMEPATH%\"
powershell.exe -ExecutionPolicy Bypass -File "Launcher.ps1" -NoProfile -NoLogo
