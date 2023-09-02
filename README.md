# VNC GPO Deployment Guide

This script automates the installation of TightVNC Server on Windows PCs via Group Policy (GPO). It allows for a silent installation and sets a predefined password for VNC authentication.

## Requirements

- Active Directory environment
- Administrative access to the target PCs
- The TightVNC MSI installer file

## Download TightVNC Installer

You can download the TightVNC MSI installer from the official TightVNC website:

[Download TightVNC MSI Installer](https://www.tightvnc.com/download.php)

## Usage

1. **Download** the TightVNC MSI installer from the provided link.

2. **Place** the MSI installer file in a shared directory accessible from your Active Directory server.

3. **Modify the script** (`install-tightvnc.ps1`) as needed. Specifically, set the `$pcInstallerPath` variable to the UNC path of the MSI installer on the shared directory and customize the `$password` variable with your desired VNC password.

   ```powershell
   # Define the UNC path to the TightVNC installer on the PC
   $pcInstallerPath = "\\<DC_IP>\<PathTo>\tightvnc-2.8.81-gpl-setup-64bit.msi"   # Change this to your desired IP + Path

   # Define the password
   $password = "your_password"  # Change this to your desired password


## Installing TightVNC on the Domain Controller

To make TightVNC work correctly, you need to install it on your domain controller. Follow these steps:

1. Log in to your domain controller with administrative privileges.

2. Open PowerShell ISE with administrator privileges.

3. Copy and paste the "TightVNC_Installation_DC_Script.ps1" into PowerShell ISE with Administrator Privlege and Run the code

4. Create a new Group Policy Object (GPO) or edit an existing one in your Active Directory environment.

5. Navigate to the "Computer Configuration" section of the GPO, and under "Policies," select "Windows Settings."

6. Right-click on "Scripts (Startup/Shutdown)" and choose "Add a Script."

7. Browse and select the modified `install-tightvnc.ps1` script.

8. Link the GPO to the Organizational Unit (OU) containing the target PCs.

9. When the PCs receive the GPO, TightVNC Server will be silently installed and configured with the specified password.
