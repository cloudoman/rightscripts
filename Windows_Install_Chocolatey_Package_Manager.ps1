# Script Home: https://github.com/writeameer/rightscripts

# Quit if already installed
if (Test-Path("$env:systemdrive\chocolatey"))
{
	"Chocolatey is already installed, exitting."
	Exit 0
}

# Install Chocolatey
$myInstallJob = Start-Job {iex ((new-object net.webclient).DownloadString('http://bit.ly/psChocInstall'))}
Wait-Job $myInstallJob

# Add Chocolatey to system path
[Environment]::SetEnvironmentVariable("PATH","$env:path;$env:systemdrive\chocolatey\bin","MACHINE")
[Environment]::SetEnvironmentVariable("PATH","$env:path;$env:systemdrive\chocolatey\chocolateyinstall","MACHINE")

# Update Nuget
& "$env:systemdrive\chocolatey\chocolateyinstall\nuget.exe" "update" "-self"