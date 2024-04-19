<#
    .SYNOPSIS
    Enables saving passwords in Remote Desktop on Windows 11.

    .DESCRIPTION
    This script adjusts Windows registry settings to allow the delegation of saved credentials for Remote Desktop. It ensures the Remote Desktop can store passwords securely.

    .NOTES
    Author: Aviad Ofek
    Requires administrative privileges. Please restart your system after running for changes to take effect.
#>

# Requires admin rights to run
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script! Please run this script as an Administrator!"
    break
}

# Set the path to the registry key
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"

# Create the registry key if it doesn't exist
if (-Not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Name of the setting to allow delegating saved credentials with NTLM-only server authentication
$ValueName = "AllowDelegatingSavedCredentials"

# Check if the value already exists
if (-Not (Get-ItemProperty -Path $RegistryPath -Name $ValueName -ErrorAction SilentlyContinue)) {
    # Create the value if it doesn't exist
    New-ItemProperty -Path $RegistryPath -Name $ValueName -Value 1 -PropertyType DWord -Force | Out-Null
    Write-Output "Registry value $ValueName created."
} else {
    # Modify the value if it already exists
    Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value 1
    Write-Output "Registry value $ValueName updated."
}

Write-Output "Done! Please restart your computer for the changes to take effect."
