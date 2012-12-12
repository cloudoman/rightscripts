# RightScript: Windows Install Chocolatey Package Manager
#
# Description: Installs the [Chocolatey](http://chocolatey.org/) package manager that's based Microsoft's Nuget.

# Inputs: none

# Author: Ameer Deen (ameer.deen@cloudoman.com)

# Copyright 2012 by Cloudoman PTY LTD., all rights reserved worldwide

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Script Home: https://github.com/cloudoman/rightscripts

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