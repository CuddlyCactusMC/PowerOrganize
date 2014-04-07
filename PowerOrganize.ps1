param (
	[string]$RF,
	[string]$XC,
	[switch]$Yank,
	[switch]$Force,
	[switch]$Help
)
Set-Location "$RF"
function Show-Help
{
	Write-Host 'PowerOrganize.ps1 is used to organize files based on filetype.'
	Write-Host 'WARNING! DO NOT USE THE -Yank FUNCTION IF FOLDER INTEGRITY IS NESSECARY'
	Write-Host
	Write-Host 'Command:               Description:'
	Write-Host '-RF "pathtofolder"     This is the path of the folder to organize.'
	Write-Host '-XC "path1, path2"     Folders to exclude from yanking'
	Write-Host '-Help                  Displays this HelpFile'
	Write-Host '-Force                 Forces the overwriting of duplicates.'
	Write-Host '-Yank                  "Yanks" all files in the folder out of its subfolder and into its root'
	Write-Host
	Write-Host 'Example:'
	Write-Host '.\PowerOrganize.ps1 -RF "C:\Users\Joe\Documents" -XC "C:\Windows, C:\Settings" -Yank -Force'
}
function Yank
{
	#Yank all files out of all folders (dont force overwrite)
	gci $RF -Recurse -File -Exclude $XC | Move-Item -Destination $RF
}
function Force-Yank
{
	#Yank all files out of all folders (force overwrite)
	gci $RF -Recurse -File -Exclude $XC | Move-Item -Destination $RF -Force
}
function Refile
{
	# get a list of files grouped by extension
	$files = gci $RF | Where-Object { -not $_.PSisContainer } | Group-Object Extension
	# create a subfolder for each type if necessary
	$files | ForEach-Object { New-Item -itemType directory -path $RF\$($_.Name) -ea SilentlyContinue }
	# move files into the appropriate subfolder
	$files | ForEach-Object { $_.Group | Move-Item -destination $RF\$($_.Extension)\$($_.Name) }
}
function Force-Refile
{
	# get a list of files grouped by extension
	$files = gci $RF | Where-Object { -not $_.PSisContainer } | Group-Object Extension
	# create a subfolder for each type if necessary
	$files | ForEach-Object { New-Item -itemType directory -path $RF\$($_.Name) -ea SilentlyContinue }
	# move files into the appropriate subfolder
	$files | ForEach-Object { $_.Group | Move-Item -destination $RF\$($_.Extension)\$($_.Name) -Force }
}
if ($Help -eq $true)
{
	Show-Help
}
else
{
	if ($RF -ne $null)
	{
		if ($Yank -eq $true)
		{
			if ($Force -eq $true)
			{
				Force-Yank
				Force-Refile
			}
			else
			{
				Yank
				Refile
			}
		}
		else
		{
			if ($Force -eq $true)
			{
				Force-Refile
			}
			else
			{
				Refile
			}
		}
	}
}
