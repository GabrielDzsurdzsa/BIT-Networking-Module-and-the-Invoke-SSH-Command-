#set package
$title = "BIT-Networking-Module-and-the-Invoke-SSH-Command-"

#Localization. 
$root = "c:\windows\temp"

#test location
if (!(Test-Path "$root\$title")) {
    #if it does not exist, create location
    New-Item -Path "$root\$title" -ItemType Directory -Force -Verbose
}

#get package
Invoke-WebRequest -Uri "https://github.com/GabrielDzsurdzsa/BIT-Networking-Module-and-the-Invoke-SSH-Command-/raw/master/$title.exe" -OutFile "$root\$title\$title.exe"

#extract package
Start-Process -FilePath "$root\$title\$title.exe" -ArgumentList "-o$root\$title -y"

#Import.
Import-Module "$root\$title\libraries\lib-Networking\mod-Networking.psm1" -DisableNameChecking -Verbose

#Show available commands 
Get-Command -module mod-Networking