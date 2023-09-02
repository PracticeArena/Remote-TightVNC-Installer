# Remote TightVNC Installer

## Overview

This script allows you to remotely install TightVNC Server on a Windows PC from a central server or domain controller. TightVNC is a free and open-source remote control software that allows you to access and control a remote computer over a network.

## Prerequisites

Before using this script, make sure you have the following:

- A Windows PC where you want to install TightVNC.
- Access to a central server or domain controller.
- The TightVNC installer (MSI file) accessible from the target PC.
- Administrative privileges on the target PC.

## Usage

1. Clone or download this repository to your central server or domain controller.

2. Modify the script with the necessary information:
   - Set the execution policy to RemoteSigned (for the current session).
   - Define the UNC path to the TightVNC installer on the PC.
   - Define the desired password for TightVNC.

3. Run the script from the central server or domain controller. This will remotely install TightVNC Server on the specified PC.

4. After installation, TightVNC Server should be running on the PC. You can use a TightVNC Viewer to connect to it using the PC's IP address.

## Script Parameters

- `$pcInstallerPath`: The UNC path to the TightVNC installer (MSI file) on the PC.
- `$password`: The password you want to set for TightVNC authentication.

## Example

```powershell
# Set the execution policy to RemoteSigned for the current session
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Define the UNC path to the TightVNC installer on the PC
$pcInstallerPath = "\\<DC_IP>\<PathTo>\tightvnc-2.8.81-gpl-setup-64bit.msi"   # Change this to your desired IP + Path for Example : \\192.168.1.100\ShareFolder\tightvnc-2.8.81-gpl-setup-64bit.msi

# Define the password
$password = "your_password"  # Change this to your desired password

# Check if the installer file exists on the PC
if (Test-Path $pcInstallerPath -PathType Leaf) {
    # Install TightVNC Server with the specified password
    Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$pcInstallerPath`" /quiet /norestart ADDLOCAL=Server SERVER_REGISTER_SERVICE=1 SERVER_ADD_FIREWALL_EXCEPTION=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=`"$password`"" -Wait

    Write-Host "TightVNC installation complete."

    # Set the execution policy back to Restricted
    Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process -Force
} else {
    Write-Host "TightVNC installer not found in the specified path on the PC."
}
