# Visual Studio Code

Notes and resources for Visual Studio Code.

## Copy Config Files

Run `Configuration/Copy-Settings.ps1` to copy these config files into your AppData User folder eg. `C:\Users\USERNAME\AppData\Roaming\Code\User`

## Offline Installation Scripts for VSCode and Git

Download the latest versions of Visual Studio Code (https://code.visualstudio.com/download) and Git (https://git-scm.com/download/win) and place them within the VSCodeGitInstallers folder alongside the installer scripts.

### Installation

#### Step 1 - Install Git and Visual Studio Code

Right-click the **Step1-InstallGitAndVSCode.ps1** script and select **Run with PowerShell**.
Follow the instructions as the computer needs to reboot after this step.

#### Step 2 - Visual Studio Code Extensions, and Git configuration

After the reboot, right-click the **Step2-InstallGitAndVSCode.ps1** script and select **Run with PowerShell**.
Enter your email and name when prompted to enable final Git configuration settings.
