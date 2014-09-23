


#
# called as:
# @powershell -NoProfile -ExecutionPolicy unrestricted -Command "$d=(new-object net.webclient); $d.Proxy.Credentials=[System.Net.CredentialCache]::DefaultNetworkCredentials; iex $d.DownloadString('http://BlockWorks.co/Downloads/BlockWorksInstall.ps1') "
#


#
# Install Chocolatey as our PackageManager...
# $d=new-object net.webclient; $d.Proxy.Credentials=[System.Net.CredentialCache]::DefaultNetworkCredentials; $d.DownloadFile('https://chocolatey.org/install.ps1','ChocInstall.ps1'); iex ChocInstall.ps1
#
$d=new-object net.webclient; 
$d.Proxy.Credentials=[System.Net.CredentialCache]::DefaultNetworkCredentials; 
$d.DownloadFile('https://chocolatey.org/install.ps1','ChocInstall.ps1');
iex ChocInstall.ps1


#
# Use Chocolatey to install VirtualBox, Vagrant & git.
#
choco install virtualbox
choco install vagrant
choco install git
choco install openssh


#
# Configure git for use behind a proxy.
# *NOTE: Change these as appropriate...
#
Get-ItemProperty 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | Select-Object *Proxy*

$proxy = [System.Net.WebRequest]::GetSystemWebProxy()
$proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials

$wc = new-object system.net.WebClient
$wc.proxy = $proxy
$webpage = $wc.DownloadData($url)

function Get-Webclient {
    $wc = New-Object Net.WebClient
    $wc.UseDefaultCredentials = $true
    $wc.Proxy.Credentials = $wc.Credentials
    $wc
}

git config --global http.proxy username:password@cameurisa01.europe.root.pri:8080
git config --global https.proxy username:password@cameurisa01.europe.root.pri:8080

set http_proxy=http://username:password@cameurisa01.europe.root.pri:8080
set https_proxy=https://username:password@cameurisa01.europe.root.pri:8080

#
# Setup a minimal BlockWorks/Build directory.
#
c:
cd\
mkdir BlockWorks
cd BlockWorks
git clone https://github.com/BlockWorksCo/Build.git


#
# Setup a few environment variables for vagrant & BlockWorks.
#
set BLOCKWORKS_BUILD_BASE=c:\BlockWorks\Build
set BLOCKWORKS_HOST_PLATFORM=Windows
set VAGRANT_CWD=c:\BlockWorks\Build\Common
set VAGRANT_VAGRANTFILE=c:\BlockWorks\Build\Common\Vagrantfile

#
# *NOTE: Change this as appropriate...
#
set BLOCKWORKS_PLATFORM_BASE=G:\Z\bluecoretest\tools\IOTestBoard\Platform

#
# Use vagrant to bring up our build machine.
#
vagrant up


