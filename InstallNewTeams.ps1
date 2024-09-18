#Set Windows to allow SideLoaded Apps
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx /v AllowAllTrustedApps /t REG_DWORD /d 1 /f

#Download MSIX Teams 64 Bit
$URL = “https://go.microsoft.com/fwlink/?linkid=2196106”
$Path=”C:\IT\MSTeams-x64.msix”
New-Item -ItemType Directory -Force -Path C:\IT
Start-BitsTransfer -Source $URL -Destination $Path


#Install MSIX app
Add-AppProvisionedPackage -online -packagepath "C:\IT\MSTeams-x64.msix" -skiplicense



# New Teams Public Desktop Shortcut
# author theDXT
 
#shortcut name
$short_name = "Microsoft Teams (work or school)"
#url for the shortcut
$URL = "msteams:/"
 
# define and call the Windows Shell
$Shell = New-Object -ComObject ("WScript.Shell")
 
# create and save the shortcut
$shortcut = $Shell.CreateShortcut("$env:Public\Desktop\$short_name.url")
$shortcut.TargetPath = $URL;
$shortcut.Save()