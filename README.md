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

    ![Wizardry Unleashed](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/50c64be4-9a53-43bf-9760-f35631f94b46)

3. **Modify the script** (`install-tightvnc.ps1`) as if you were brewing a potion. Set the `$pcInstallerPath` variable to the UNC path of the MSI installer on the shared directory and conjure up the `$password` variable with your desired VNC password.

   ```powershell
   # Define the UNC path to the TightVNC installer on the PC
   $pcInstallerPath = "\\<DC_IP>\<PathTo>\tightvnc-2.8.81-gpl-setup-64bit.msi"   # Change this to your desired IP + Path

   # Define the password
   $password = "your_password"  # Change this to your desired password

    ![Script Configuration Magic](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/5eff632f-bd92-4b99-a3ec-7faaebad524f)

   - Behold the image, a glimpse of the DC, where the shared folder lies, and from which the script shall journey forth into the GPO Path [ Step 6 ].
   - The '$pcInstallerPath' shall be the path to the '.msi' file on the PC.
   
    ![Magical PC Path](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/2fa7eb1b-4302-4871-a288-377295447df7)

    ## Modify 'install-tightvnc.ps1' Example: 
![install-script-configuration](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/5eff632f-bd92-4b99-a3ec-7faaebad524f)

    - The image on the top is from The DC that contain the shared folder, from this folder we will copy and past the script into the GPO Path [ Step 6 ] 
   
    - The '$pcInstallerPath' has to be set to the '.msi' file path from the PC
![image](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/2fa7eb1b-4302-4871-a288-377295447df7)

## Enchanting TightVNC on the Domain Controller

To unleash the full potential of TightVNC, embark on this magical quest to install it on your domain controller:

1. As a wizard with administrative privileges, login to your domain controller.

2. With a wave of your wand, open PowerShell ISE as an administrator.

3. Copy and paste the "TightVNC_Installation_DC_Script.ps1" into PowerShell ISE with Administrator Privilege and Run the code. Watch as the magic unfolds!

4. Forge a new Group Policy Object (GPO) or alter an existing one within your Active Directory realm.

5. Venture to the "Computer Configuration" section of the GPO and under "Policies," select "Windows Settings."

6. Click on 'Scripts,' as if summoning spirits, and then 'Startup/Shutdown.'

7. Under the 'PowerShell Scripts' tab, click 'Add,' then 'Browse.' Cast your gaze upon the 'install-tightvnc.ps1' [crafted in Step 3], and press 'OK.' With a final incantation of 'Apply' and 'OK,' the magic is sealed!

9. Link the GPO to the Organizational Unit (OU) housing the target PCs. You may need to employ your enchanting skills.

10. Check for read+execute permissions and verify the GPO Security Filtering to ensure the magic flows freely.

11. As the PCs receive the GPO, TightVNC Server will be silently installed, and the enchanting password you've conjured shall be set.

## POC
![POC](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/a8cdf591-6097-413b-b4bd-1549a7dad9e5)


Feel the magic, embrace the ease, and let your VNC GPO Deployment be a spellbinding experience! 🪄✨
