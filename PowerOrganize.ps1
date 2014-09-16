param (
    [string]$RF,
    [string]$XC,
    [switch]$Help,
    [switch]$NoDupe,
    [switch]$Date,
    [switch]$Type
)
New-Item -Path "$env:APPDATA" -Value "PowerOrganize" -ItemType Directory -Force | Out-Null
New-Item -Path "$env:APPDATA\PowerOrganize" -Value "DateOrg" -ItemType Directory -Force | Out-Null
New-Item -Path "$env:APPDATA\PowerOrganize" -Value "TypeOrg" -ItemType Directory -Force | Out-Null
$dateorg = "$env:APPDATA\PowerOrganize\DateOrg"
$typeorg = "$env:APPDATA\PowerOrganize\TypeOrg"
Set-Location "$RF"
if ($PSVersionTable.PSVersion  -lt "3.0"){
Write-Warning "Powershell must be at least version 3.0"
Write-Warning "Exiting"
Start-Sleep 10
Exit
}
function Delete-Duplicates {
#requires -version 3
[CmdletBinding()]
param (
    [string]
    $Path
)
 
function Get-MD5 {
    param (
        [Parameter(Mandatory)]
        [string] 
        $Path
    )
    # This Get-MD5 function sourced from:
    # http://blogs.msdn.com/powershell/archive/2006/04/25/583225.aspx
    $HashAlgorithm = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $Stream = [System.IO.File]::OpenRead($Path)
    try {
        $HashByteArray = $HashAlgorithm.ComputeHash($Stream)
    } finally {
        $Stream.Dispose()
    }
 
    return [System.BitConverter]::ToString($HashByteArray).ToLowerInvariant() -replace '-',''
}
 
if (-not $Path) {
    if ((Get-Location).Provider.Name -ne 'FileSystem') {
        Write-Error 'Specify a file system path explicitly, or change the current location to a file system path.'
        return
    }
    $Path = (Get-Location).ProviderPath
}
 
Get-ChildItem -Path $Path -Recurse -File |
    Where-Object { $_.Length -gt 0 } |
    Group-Object -Property Length |
    Where-Object { $_.Count -gt 1 } |
    ForEach-Object {
        $_.Group |
            ForEach-Object {
                $_ |
                    Add-Member -MemberType NoteProperty -Name ContentHash -Value (Get-MD5 -Path $_.FullName)
            }
 
        $_.Group |
            Group-Object -Property ContentHash |
            Where-Object { $_.Count -gt 1 }
    }
}
function Organize-Date {
[CmdletBinding()]
Param(
   [Parameter(Mandatory=$true)] 
    [string]$src,
    [switch]$doit,
    [string]$target,
    [switch]$force,
    [switch]$reverse
   )
  
 function getMD5{
     Param (
        $c_file
    )
    $md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($c_file)))
    $hash
 }
 
     if ( $target ){
        
    }
    else {
        $target=$src
    }
    #todo Better error checking for compare $src and $target
    Write-Host "Target: $target"
    Write-Host "Source: $src"
    if ( (Test-path "$src") -ne $True ) {
        Write-Host "Source Dir does not exist."
        break
    }
    
    If ( $target -eq $src ) {
        Write-Host "++MOVE_MODE: source directory is same as target directory"
        $cmd_mode = 'Move-Item'
        $cmd_string = 'Move'
    }
    else {
        Write-Host "++COPY_MODE: source directory is different than target directory"
        $cmd_mode = 'Copy-Item'
        $cmd_string = 'Copy'
    }
 
$Files = Get-ChildItem -recurse "$src"
 
$num_entry_in_src = ($Files ).count
Write-Verbose "Num of Entry in the Source: $num_entry_in_src"
If ( $num_entry_in_src -eq 0){
    Write-Host "No File found in Source directory."
}
 
$exclude_foders = @()
$want_files =@()
foreach ($file in $Files) 
{
    #TODO add progress bar
    #TODO move flag to write-verbose
    $full_name = $file.fullname
    if ( $file.PSIsContainer -eq $true ){
        write-verbose "$full_name is directory"
    }
    else {
        # check special name directory
        $file_dir_name = $file.Directory.Name
        $file_full_dir_name = $file.DirectoryName
        if ( $file_dir_name -match '^\d\d\d\d[a-zA-Z_]'){
            Write-verbose "DIR: $file_full_dir_name"
            Write-verbose "File directory match exclude naming convention"
            $exclude_foders += ,$file_full_dir_name
            continue
        }
        
        $last_writeTime = $file.LastWriteTime
   
        If ($last_writeTime.day -lt 10){
            $strDay = '0' +  [string] $last_writeTime.day
        }
        else {
            $strDay = [string] $last_writeTime.day
        }
  
    $strYear = [string] $last_writeTime.year
        If ( $last_writeTime.month -lt 10){
            $strMonth = '0' + [string] $last_writeTime.month
        }
        else {
            $strMonth = [string] $last_writeTime.month
        }
    $DateTaken = $strYear + $strMonth + $strDay
    $MonthTaken = $strYear + $strMonth
    $file | Add-Member –MemberType NoteProperty –Name myDataTaken –Value $DateTaken
    $file | Add-Member –MemberType NoteProperty –Name myMonth –Value $MonthTaken
    $file | Add-Member –MemberType NoteProperty –Name myYear –Value $strYear
    
    $myDataTaken = $file.myDataTaken
    Write-verbose "$full_name -> DayTaken: $myDataTaken,MonthTaken:$MonthTaken,YearTaken:$strYear   "
    $want_files += ,$file
    } 
}
if ( $doit -eq $true ){        
    $flag= '++DOIT:'
}
else {
    $flag = '++DRYRUN'
}
 
 
    # Create the folder 
$folder_create_arrary = @()
 
$file_new_arrary = @()    
$file_md5_diff_overwrite_arrary = @()
$file_md5_diff_non_overwrite_arrary = @()
$file_md5_same_overwrite_array= @()
$file_md5_same_non_overwrite_arrary = @()
 
    foreach ($file in $want_files) {
        $month_dir = $file.myMonth
        $year_dir = $file.myYear
        If ( $reverse -eq $true) {
            $full_new_dir=$target
        }
        else {
            $full_new_dir = "$target\$year_dir\$month_dir"
        }
        $full_path = $file.fullname
        $TimeStamp = $file.myDataTaken
        $short_name = $file.name
        $new_file_path = "$full_new_dir\$short_name"
        if ( (Test-path $full_new_dir) -eq $true ){
            Write-host "$full_new_dir already exist."
        }
        else {
            # create dir
            $folder_create_arrary += ,$full_new_dir
            if ( $doit -eq $true ){
                write-host "++DOIT: $full_new_dir does not exist . creating ..."
                mkdir "$full_new_dir" | out-null
                
            }
            else {
                Write-host "$flag $full_new_dir does not exist . creating ..."
            }
        }
        
        If ( (test-path $new_file_path) -eq $true ){
        # Same file name exist
            $target_md5 = getMD5("$new_file_path")
            $src_md5 = getMD5("$full_path")
        
            if ( "$src_md5" -eq "$target_md5"){
                # MD5 same
                If ( $force -eq $true){
                    # OverWrite FIle 
                    $file_md5_same_overwrite_array += ,$file
                    Write-host "$flag $short_name($TimeStamp) is the same between source and target. Force flag in place."
                    if ( $doit -eq $true ){        
                        & $cmd_mode "$full_path" "$full_new_dir" -force
                    }
                }
                else {
                    Write-host "I am here"
                    $file_md5_same_non_overwrite_array += ,$file
                    Write-host "$flag $short_name is the same between source and target. No action taken."
                }
            }
            else {
                # MD5 Diff
                Write-Verbose "SRC: $src_md5"
                Write-Verbose "TAR: $target_md5"
                If ( $force -eq $true){
                    $file_md5_diff_overwrite_arrary += ,$file
                    Write-host "$flag $short_name($TimeStamp) is different between soruce and target."
                    if ( $doit -eq $true ){        
                        & $cmd_mode "$full_path" "$full_new_dir"
                    }
                }
                else {
                    $file_md5_diff_non_overwrite_arrary += ,$file
                    Write-host "$flag $short_name($TimeStamp) is different between soruce and target."
                }
                            
            }
        }
        else {
        # new files
            $file_new_arrary += ,$file
            if ( $doit -eq $true ){        
                Write-host "$flag $cmd_string $full_path($TimeStamp) to $full_new_dir"
                & $cmd_mode "$full_path" "$full_new_dir"
            }
            else {
                Write-host "$flag $cmd_string $full_path($TimeStamp) to $full_new_dir"
            }
        }
    }
}
function Show-Help
{
    Write-Host 'PowerOrganize v2.3'
    Write-Host 'PowerOrganize.ps1 is used to organize files based on filetype, and date.'
    Write-Host 'WARNING! DO NOT USE IF FOLDER INTEGRITY IS NESSECARY'
    Write-Host
    Write-Host 'Command:               Description:'
    Write-Host '-RF "pathtofolder"     This is the path of the folder to organize.'
    Write-Host '-XC "path1, path2"     Folders to exclude from yanking.'
    Write-Host '-Help                  Displays this HelpFile.'
    Write-Host '-Type                  Organize files by file type.'
    Write-Host '-Date                  Organize files by date created.'
    Write-Host '-NoDupe                Forcibly removes any duplicates based on file hash.'
    Write-Host
    Write-Host 'Example:'
    Write-Host '.\PowerOrganize.ps1 -RF "C:\Users\Joe\Documents" -XC "C:\Windows, C:\Settings" -Type -NoDupe'
}
#depreciated
#function Yank
#{
	#Yank all files out of all folders (dont force overwrite)
#	gci $RF -Recurse -File -Exclude $XC | Move-Item -Destination $RF
#}
function De-Subfolder
{
	#Yank all files out of all folders (force overwrite)
	gci $RF -Recurse -File -Exclude $XC | Move-Item -Destination $RF -Force
}
#Depreciated
#function Refile
#{
	# get a list of files grouped by extension
#	$files = gci $RF | Where-Object { -not $_.PSisContainer } | Group-Object Extension
	# create a subfolder for each type if necessary
#	$files | ForEach-Object { New-Item -itemType directory -path $typeorg\$($_.Name) -ea SilentlyContinue }
	# move files into the appropriate subfolder
#	$files | ForEach-Object { $_.Group | Move-Item -destination $typeorg\$($_.Extension)\$($_.Name) }
    Move-Item -Path "$typeorg\*" -Destination "$RF" -Force
}
function Organize-Type
{
	# get a list of files grouped by extension
	$files = gci $RF | Where-Object { -not $_.PSisContainer } | Group-Object Extension
	# create a subfolder for each type if necessary
	$files | ForEach-Object { New-Item -itemType directory -path $typeorg\$($_.Name) -ea Continue}
	# move files into the appropriate subfolder
	$files | ForEach-Object {$_.Group | Move-Item -destination $typeorg\$($_.Extension)\$($_.Name) -Force}
    Remove-Item "$RF\*" -Recurse -Force
    Move-Item -Path "$typeorg\*" -Destination "$RF" -Force
}
if ($Help -eq $true)
{
	Show-Help
}
else
{
  if ($RF -ne $null)
  {
    if ($NoDupe -eq $true)
    {
        Remove-Duplicates -Path "$RF"
    }
    if ($Date -eq $true)
    {
    Organize-Date -src "$RF" -target "$dateorg" -doit -force
    Remove-Item "$RF\*" -Recurse -Force
    Move-Item -Path "$dateorg\*" -Destination "$RF" -Force
    }
    if ($Type -eq $true)
    {
   		De-Subfolder
		Organize-Type
    }
  }
}
