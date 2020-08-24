# BIT-Networking-Module-and-the-Invoke-SSH-Command-

<!--- These are examples. See https://shields.io for others or to customize this set of shields. You might want to include dependencies, project status and licence info here --->
![GitHub stars](https://img.shields.io/github/stars/GabrielDzsurdzsa/BIT-Networking-Module-and-the-Invoke-SSH-Command-?style=social)
![GitHub forks](https://img.shields.io/github/forks/GabrielDzsurdzsa/BIT-Networking-Module-and-the-Invoke-SSH-Command-?style=social)

BIT-Networking-Module-and-the-Invoke-SSH-Command- is a `<Powershell library>` that allows `<Administrators>` to `<manage their Linux web servers using SSH, straight out of Windows Powershell>`.

Additionally, this library comes with several Kaseya Automation Exchange VSA procedures, implementing the library in Kaseya for instant remote execution. 

## Prerequisites

Before you begin, ensure you have met the following requirements:
<!--- These are just example requirements. Add, duplicate or remove as required --->
* You have installed 5.1 version of `<PowerShell>`
* You have a `<Windows>` machine. Any Windows 7 and Up version, as long as PS 5.1 is present.
* Root level account SSH credentials, ip to the server, username and password for your connection parameters. You will have to get these credentials from your hosting provider, or your WHM or cPanel interface. For example: (https://ca.godaddy.com/help/connect-to-my-server-with-ssh-secure-shell-4943)

## Installing <BIT-Networking-Module-and-the-Invoke-SSH-Command->

To install <BIT-Networking-Module-and-the-Invoke-SSH-Command->, follow these steps:

Windows (new powershell session as admin):
```
set-location c:\windows\temp; Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/GabrielDzsurdzsa/BIT-Networking-Module-and-the-Invoke-SSH-Command-/raw/master/init.ps1'))
```
## Using <BIT-Networking-Module-and-the-Invoke-SSH-Command->

To use <BIT-Networking-Module-and-the-Invoke-SSH-Command->, follow these steps:

Start a powershell session in Windows, run the command from To Install section. Then execute these commands in order.

```
$ip = "xx.xxx.xx.x"; $username = "username"; $password = ConvertTo-SecureString "********" -Force -AsPlainText #construct connection parameters
$session = connect-SSH -ip $ip -username $username -password $password #connect to SSH Session
$users = Invoke-SSH-Command -session $session -command "less /etc/passwd" #invoke ssh command and return an object[] with all users on web server, this command can be any SSH command supported by your web server
$export = $users | Foreach-Object {New-Object PSCustomObject -Property @{User = $_}} #convert to exportable object[]
$export | Export-Csv .\users.csv -NoTypeInformation -Delimiter "," #to export the users dataset to csv
```
## To use with your Kaseya VSA

To use with your Kaseya VSA, just:

1. Import the <Procedure Folder BIT-Networking-Module-and-the-Invoke-SSH-Command-.xml> file, present in this repository, into your Kaseya VSA
2. Execute Procedures

Using the Invoke SSH Command procedure allows you to enter any SSH command. Some examples of common commands are:

1. ls
2. find
3. du
4. cat

## Contributing to <BIT Networking Module and Invoke-SSH-Command>
<!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
To contribute to <BIT Networking Module and Invoke-SSH-Command>, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <master>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <BIT Networking Module and Invoke-SSH-Command->/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Contributors

Thanks to the following people who have contributed to this project:

* [All Contributors](https://github.com/all-contributors/all-contributors) 📖

## Contact

If you want to contact me you can reach me at <gabriel@bercell.com>.

## License
<!--- If you're not sure which open license to use see https://choosealicense.com/--->

This project uses the following license: <MIT License> <https://opensource.org/licenses/MIT>.
