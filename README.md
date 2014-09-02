PowerOrganize is a command line utility used to organize directories based on file type or file date. It also allows the deletion of duplicates based on MD5

PowerOrganize requires the latest Powershell and .NET release(You should update your stuff anyway as doing so fixes security issues.)

THIS PROGRAM, IF RUN ON A WINDOWS SYSTEM FOLDER WILL DESTROY ITS FILE STRUCTURE, USE THIS PROGRAM ONLY ON DOCUMENTS FOLDERS!

open cmd or powershell and type for help:

	.\PowerOrganize.ps1 -Help

Help Exerpt:

	PowerOrganize v2.1
	PowerOrganize.ps1 is used to organize files based on filetype, and date.
	WARNING! DO NOT USE IF FOLDER INTEGRITY IS NESSECARY
	
	Command:               Description:
	-RF "pathtofolder"     This is the path of the folder to organize.
	-XC "path1, path2"     Folders to exclude from yanking.
	-Help                  Displays this HelpFile.
	-Type                  Organize files by file type.
	-Date                  Organize files by date created.
	-NoDupe                Forcibly removes any duplicates based on file hash.

	Write-Host Example:
	Write-Host .\PowerOrganize.ps1 -RF "C:\Users\Joe\Documents" -XC "C:\Windows, C:\Settings" -Type -NoDupe

THIS PROGRAM, IF RUN ON A WINDOWS SYSTEM FOLDER WILL DESTROY ITS FILE STRUCTURE, USE THIS PROGRAM ONLY ON DOCUMENTS FOLDERS!
