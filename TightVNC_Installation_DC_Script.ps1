# Basic silent installation
msiexec /i "C:\Path\to\tightvnc-2.7.1-setup-64bit.msi" /quiet /norestart

# Install only the server part
msiexec /i "C:\Path\to\tightvnc-2.7.1-setup-64bit.msi" /quiet /norestart ADDLOCAL=Server

# Enable VNC authentication with a password
msiexec /i "C:\Path\to\tightvnc-2.7.1-setup-64bit.msi" /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=your_password

# Enable control interface authentication with a password
msiexec /i "C:\Path\to\tightvnc-2.7.1-setup-64bit.msi" /quiet /norestart SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=trotadmin
