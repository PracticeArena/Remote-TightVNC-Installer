# 🚀 Welcome to the TightVNC GPO Deployment Guide!

Are you tired of manually installing TightVNC on your Windows PCs within an Active Directory environment? Say goodbye to the hassle with our straightforward TightVNC Group Policy (GPO) deployment guide. ✨

## Requirements 🧙‍♂️

Before you start, make sure you have:

- An Active Directory environment in place.
- Administrative access to the target PCs.
- The TightVNC MSI installer file.

## 📥 Download the TightVNC Installer

**Step 1:** Download the TightVNC MSI installer from the official website:
[Download TightVNC MSI Installer](https://www.tightvnc.com/download.php)

**Step 2:** Place the downloaded MSI installer file in a shared folder that's accessible from your Active Directory server. 

    ![Wizardry Unleashed](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/50c64be4-9a53-43bf-9760-f35631f94b46)

**Step 3:** Modify the script (`install-tightvnc.ps1`) as follows:

   ```powershell
   # Define the UNC path to the TightVNC installer on the PC
   $pcInstallerPath = "\\<DC_IP>\<PathTo>\tightvnc-2.8.81-gpl-setup-64bit.msi"   # Change this to your desired IP + Path

   # Define the password
   $password = "your_password"  # Change this to your desired password

    ![Script Configuration Magic](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/5eff632f-bd92-4b99-a3ec-7faaebad524f)

   - Set the desired VNC password in '$password'.
   - Update '$pcInstallerPath' to point to the '.msi' file path on the PC.
   
    ![Magical PC Path](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/2fa7eb1b-4302-4871-a288-377295447df7)

## Deploy TightVNC

**Step 4:** Install TightVNC on your domain controller:

- Log in to your domain controller with administrative privileges.
- Open PowerShell ISE as an administrator.
- Copy and paste the content of "TightVNC_Installation_DC_Script.ps1" into PowerShell ISE and run the code.

**Step 5:** Set up Group Policy:

- Create a new Group Policy Object (GPO) or modify an existing one in your Active Directory domain.
- Navigate to "Computer Configuration" in the GPO and select "Windows Settings" under "Policies."
- Under GPO settings, go to "Scripts" and select "Startup/Shutdown."
- Under the 'PowerShell Scripts' tab, click 'Add' -> 'Browse.' Paste the 'install-tightvnc.ps1' script (modified in Step 3), and press 'OK.' Save your changes.

**Step 6:** Apply the GPO:

- Link the GPO to the Organizational Unit (OU) containing the target PCs.
- Verify read and execute permissions and GPO Security Filtering.


## POC
![POC](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/adf31860-3c17-47a2-a077-c9847bccefd6)

Feel the magic, embrace the ease, and let your VNC GPO Deployment be a spellbinding experience! 🪄✨
