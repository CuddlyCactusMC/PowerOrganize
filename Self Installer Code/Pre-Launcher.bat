copy "%0\License.lic" "%HOMEDRIVE%%HOMEPATH%\TEMP\"
copy "%0\PowerOrganize.ps1" "%HOMEDRIVE%%HOMEPATH%\TEMP\"
copy "%0\README.md" "%HOMEDRIVE%%HOMEPATH%\TEMP\"
copy "%0\Launcher.ps1" "%HOMEDRIVE%%HOMEPATH%\TEMP\"
copy "%0\Pre-Launcher.bat" "%HOMEDRIVE%%HOMEPATH%\TEMP\"
powershell.exe -ExecutionPolicy Bypass -File "Launcher.ps1" -NoProfile -NoLogo
