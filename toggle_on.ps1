if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Echo "Undoing CNIT-133 Preparations."
Echo "Enabling Firewall..."
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
Echo "Firewall Enabled."
Echo "Enabling Network Adapter..."
Enable-NetAdapter -Name "Wi-Fi"
Echo "Network Adapter Enabled."
Echo "Connections Reset."
Start-Sleep -Seconds 2