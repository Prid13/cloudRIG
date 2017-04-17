#Install Device Management

Install-PackageProvider -Name NuGet -Force

(New-Object System.Net.WebClient).DownloadFile("https://gallery.technet.microsoft.com/Device-Management-7fad2388/file/65051/2/DeviceManagement.zip", "c:\crsetup\DeviceManagement.zip")
Expand-Archive -LiteralPath "c:\crsetup\DeviceManagement.zip" -DestinationPath "c:\crsetup\DeviceManagement"
Move-Item "c:\crsetup\DeviceManagement\Release" $PSHOME\Modules\DeviceManagement
(Get-Content "$PSHOME\Modules\DeviceManagement\DeviceManagement.psd1").replace("PowerShellHostVersion = '3.0'", "PowerShellHostVersion = ''") | Out-File "$PSHOME\Modules\DeviceManagement\DeviceManagement.psd1"
Import-Module DeviceManagement

$LASTEXITCODE