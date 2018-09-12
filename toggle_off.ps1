if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

echo "CNIT-133 Hardware Setup"
echo "Detecting system settings, please wait."

function sysDetect {
$wirelessAdapter = (Get-NetAdapter -name "Wi-Fi")
if (-eq $wirelessAdapter) {
echo "Wi-Fi Adapter located."

    }

}


echo "try again, it didn't work yet"
Start-Sleep -Seconds 3
<#
Echo "Preparing Device for CNIT-133 Hardware Connection"
Echo "Disabling Network Adapter..."
Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false
Echo "Network Adapter Disabled."
Echo "Disabling Firewall..."
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Echo "Firewall Disabled."
Echo "Device prepared for CNIT-133 Hardware Connctions"
Start-Sleep -Seconds 2
#>