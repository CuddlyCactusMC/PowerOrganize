PowerOrganize is a command line utility used to organize directories.

PowerOrganize requires the latest Powershell and .NET release(You should update your stuff anyway as doing so fixes security issues.)

THIS PROGRAM, IF RUN ON A WINDOWS SYSTEM FOLDER WILL DESTROY ITS FILE STRUCTURE, USE THIS PROGRAM ONLY ON DOCUMENTS FOLDERS!

open cmd or powershell and type for help:

	.\PowerOrganize.ps1 -Help

Help Exerpt:

	PowerOrganize.ps1 is used to organize files based on filetype.
	WARNING! DO NOT USE THE -Yank FUNCTION IF FOLDER INTEGRITY IS NESSECARY
	Write-Host
	Command:               Description:
	-RF "pathtofolder"     This is the path of the folder to organize.
	-XC "path1, path2"     Folders to exclude from yanking
	-Help                  Displays this HelpFile
	-Force                 Forces the overwriting of duplicates.
	-Yank                  "Yanks" all files in the folder out of its subfolder and into its root
	Write-Host
	Example:
	.\PowerOrganize.ps1 -RF "C:\Users\Joe\Documents" -XC "C:\Windows, C:\Settings" -Yank -Force

THIS PROGRAM, IF RUN ON A WINDOWS SYSTEM FOLDER WILL DESTROY ITS FILE STRUCTURE, USE THIS PROGRAM ONLY ON DOCUMENTS FOLDERS!
