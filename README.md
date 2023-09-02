# 🚀 Welcome to the TightVNC GPO Magic!

Are you tired of manually installing TightVNC on your Windows PCs within an Active Directory environment? Say goodbye to the hassle, and embrace the magic of our VNC GPO Deployment Guide! ✨

## ✨ The Marvelous VNC GPO Deployer ✨

Our script is your trusty sidekick in automating the installation of TightVNC Server on your Windows PCs via Group Policy (GPO). It not only simplifies the process but adds a sprinkle of magic to it.

## Requirements 🧙‍♂️

To wield this powerful script, make sure you have:

- A thriving Active Directory environment
- The magical administrative access to the target PCs
- The enchanted TightVNC MSI installer file

## 🪄 Download the Magical Installer

Grab the magical TightVNC MSI installer from the mystical official TightVNC website:

[Download TightVNC MSI Installer](https://www.tightvnc.com/download.php)

## Spellbinding Usage ✨

1. **Download** the TightVNC MSI installer from the provided link, and feel the magic within it.

2. **Place** the MSI installer file in a shared directory accessible from your Active Directory server. 

3. **Modify the script** (`install-tightvnc.ps1`) as if you were brewing a potion. Set the `$pcInstallerPath` variable to the UNC path of the MSI installer on the shared directory and conjure up the `$password` variable with your desired VNC password.

   ```powershell
   # Define the UNC path to the TightVNC installer on the PC
   $pcInstallerPath = "\\<DC_IP>\<PathTo>\tightvnc-2.8.81-gpl-setup-64bit.msi"   # Change this to your desired IP + Path

   # Define the password
   $password = "your_password"  # Change this to your desired password

    ## Modify 'install-tightvnc.ps1' Example: 
![install-script-configuration](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/5eff632f-bd92-4b99-a3ec-7faaebad524f)

    - The image on the top is from The DC that contain the shared folder, from this folder we will copy and past the script into the GPO Path [ Step 7 ] 
   
    - The '$pcInstallerPath' has to be set to the '.msi' file path from the PC
![image](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/2fa7eb1b-4302-4871-a288-377295447df7)

## Enchanting TightVNC on the Domain Controller

To unleash the full potential of TightVNC, embark on this magical quest to install it on your domain controller:

1. Log in to your domain controller with administrative privileges.

2. Open PowerShell ISE by right-clicking and choosing "Run as Administrator."

3. Copy and paste the "TightVNC_Installation_DC_Script.ps1" into PowerShell ISE with Administrator Privilege and Run the code. Watch as the magic unfolds!
    ![Wizardry Unleashed](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/50c64be4-9a53-43bf-9760-f35631f94b46)
   
4. Create a new Group Policy Object (GPO) or modify an existing one in your Active Directory domain.

5. Navigate to "Computer Configuration" in the GPO and select "Windows Settings" under "Policies."

6. Navigate to "Scripts" and select "Startup/Shutdown" within the GPO settings.

7. Under the 'PowerShell Scripts' tab, click 'Add' -> 'Browse.' Paste the 'install-tightvnc.ps1' [crafted in Step 3], and press 'OK.' With a final incantation of 'Apply' and 'OK,' the magic is sealed!

8. Link the GPO to the Organizational Unit (OU) housing the target PCs. You may need to employ your enchanting skills.

9. Check for read+execute permissions and verify the GPO Security Filtering to ensure the magic flows freely.

10. As the PCs receive the GPO, TightVNC Server will be silently installed, and the enchanting password you've conjured shall be set.

## POC
![POC](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/adf31860-3c17-47a2-a077-c9847bccefd6)


Feel the magic, embrace the ease, and let your VNC GPO Deployment be a spellbinding experience! 🪄✨
