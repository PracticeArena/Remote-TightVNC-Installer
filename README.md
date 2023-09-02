# TightVNC Installer Script

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

```
    1. Create a new Group Policy Object (GPO) or edit an existing one in your Active Directory environment.

    2. Navigate to the "Computer Configuration" section of the GPO, and under "Policies," select "Windows Settings."

    3. Right-click on "Scripts (Startup/Shutdown)" and choose "Add a Script."

    4. Browse and select the modified install-tightvnc.ps1 script.

    5. Link the GPO to the Organizational Unit (OU) containing the target PCs.

    6. When the PCs receive the GPO, TightVNC Server will be silently installed and configured with the specified password.
```