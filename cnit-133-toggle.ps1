if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Connor Farnworth
# farnworth.co
# 2018
# CNIT 133
# Description:
# This script is designed to toggle the Wi-Fi adapter and Firewall, to ensure a lossless communication between the terminal and the networking equipment.


echo "CNIT-133 Hardware Setup"
echo ""
echo "Detecting system settings, please wait."
echo ""

#checks for wifi adapter
if (Get-netadapter | where name -eq "Wi-Fi") {
echo "Wi-Fi Adapter located."
# breakout- either enables or disabled based off of current status (toggle)

#enables
if (get-netadapter | where status -eq "disabled"){
echo "Enabling Firewall..."
set-netfirewallprofile -profile domain, public, private -enabled true
echo "Firewall Enabled."
echo "Enabling Wi-Fi Adapter..."
enable-netadapter -name "Wi-Fi"
echo "Wi-Fi Adapter Enabled."
echo ""
echo "Device prepared for normal usage."
}
#disables
if (get-netadapter | where status -eq "up") {
echo "Disabling Wi-Fi Adapter..."
disable-netadapter -Name "Wi-Fi" -Confirm:$false
echo "Wi-Fi Adapter Disabled."
echo "Disabling Firewall..."
set-netfirewallprofile -profile domain, public, private -enabled false
echo "Firewall Disabled."
echo ""
echo "Device prepared for CNIT-133 Hardware Connctions"
}
}

Start-Sleep -seconds 3