# Set the execution policy to RemoteSigned for the current session
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Define the UNC path to the TightVNC installer on the PC
$pcInstallerPath = "\\<IP>\<PathTo>\tightvnc-2.8.81-gpl-setup-64bit.msi"

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