[Version]
Class=IEXPRESS
SEDVersion=3
[Options]
PackagePurpose=InstallApp
ShowInstallProgramWindow=0
HideExtractAnimation=1
UseLongFileName=1
InsideCompressed=0
CAB_FixedSize=0
CAB_ResvCodeSigning=0
RebootMode=N
InstallPrompt=%InstallPrompt%
DisplayLicense=%DisplayLicense%
FinishMessage=%FinishMessage%
TargetName=%TargetName%
FriendlyName=%FriendlyName%
AppLaunched=%AppLaunched%
PostInstallCmd=%PostInstallCmd%
AdminQuietInstCmd=%AdminQuietInstCmd%
UserQuietInstCmd=%UserQuietInstCmd%
SourceFiles=SourceFiles
[Strings]
InstallPrompt=
DisplayLicense=C:\Users\cbaxter\OneDrive\Programs\License.txt
FinishMessage=
TargetName=C:\Users\cbaxter\OneDrive\Programs\GitHub\PowerOrganize\Self Installers\x64\PowerOrganize_v2.3_x64.EXE
FriendlyName=PowerOrganize v2.3 x64 Installer
AppLaunched=cmd.exe /c echo
PostInstallCmd=cmd.exe /c Pre-Launcher.bat
AdminQuietInstCmd=
UserQuietInstCmd=
FILE0="License.lic"
FILE1="PowerOrganize.ps1"
FILE2="README.md"
FILE3="Launcher.ps1"
FILE4="Pre-Launcher.bat"
[SourceFiles]
SourceFiles0=C:\Users\cbaxter\OneDrive\Programs\GitHub\PowerOrganize\
SourceFiles1=C:\Users\cbaxter\OneDrive\Programs\GitHub\PowerOrganize\Self Installer Code\
[SourceFiles0]
%FILE0%=
%FILE1%=
%FILE2%=
[SourceFiles1]
%FILE3%=
%FILE4%=
