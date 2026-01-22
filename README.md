# NVIDIA-Recording-Automation-Script-that-compresses-the-videos-inside-Windows-
A Windows Batch automation script that processes NVIDIA ShadowPlay / GeForce Experience / Nvidia App recordings using HandBrakeCLI.  This script is written and maintained by me, while HandBrakeCLI is a third-party tool and full credit goes to its original developers.


✨ What This Script Does

📂 Automates processing of NVIDIA recordings

⚙️ Uses HandBrakeCLI for video encoding/conversion

🕒 Saves time by removing repetitive manual steps

🪟 Designed specifically for Windows

⌚ Does the encoding after startop

This script is only an automation wrapper, not a video encoder itself.

#📦 Requirements

Before running the script, make sure you have:

✅ Windows 10 / 11

✅ NVIDIA ShadowPlay / GeForce Experience recordings


# HOW TO INSTALL

first copy the Handbrake folder to the "C" drive

Then open the "automation for Nvidia recordings 4.bat" and set the root folder

then press win+R type = shell:startup
and copy the "launch_handbrake_hidden.vbs" there

Open the handbrake folder and edit the "add_video_compressor_startup.reg" if you need


For notification, install this in PowerShell - 

1.  Install-Module -Name BurntToast -Force
2.  Install-Module -Name BurntToast -Scope CurrentUser -Force
3.  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser



This script does not include HandBrakeCLI

Internet is not required after setup

Encoding speed depends on:

CPU / GPU

Video length

Preset used

You can safely re-run the script multiple times

📜 Credits & Acknowledgements
🔹 Script Author

Created and maintained by me

This repository contains only automation logic

🔹 HandBrakeCLI

Official website: https://handbrake.fr

HandBrakeCLI is a free, open-source video transcoder

All rights and credit belong to the HandBrake development team

This project does not claim ownership of HandBrakeCLI.

⚖️ Disclaimer

This project is not affiliated with NVIDIA or HandBrake

## Third-Party Software

This project bundles **HandBrakeCLI**, which is not created or maintained by me.

- Project: HandBrake
- Website: https://handbrake.fr
- Source Code: https://github.com/HandBrake/HandBrake
- License: GNU GPL v2

All rights belong to the HandBrake development team.


Use at your own risk

Always keep backups of original recordings

❤️ Final Note

If you find this script useful:

⭐ Star the repository

❤️ Support the HandBrake project

🛠 Modify the script for your own workflow


   
	





