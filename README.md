# Spotify Anti-Pauser
Uses the power of the Windows firewall to block Discord from pausing Spotify if your mic has been on for 30 seconds straight.

## Imporant notes
Spotify Anti-Pauser creates a Firewall rule that blocks Discord from contacting Spotify's servers so they can't pause your music.

# Installation
1. Download this project as a zip file (see example picture below).
2. Unzip the project to your preferred location.
3. For running the script, proceed to the "Running Script" section.
![download instructions](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fhelpdeskgeek.com%2Fwp-content%2Fpictures%2F2021%2F06%2F11CodeButtonDownloadZip.png&f=1&nofb=1&ipt=dbc33612dfeecd66a18ef3f5299f698fa2112bc7e3b31a079e29bc38f7893ba9&ipo=images)

## Running Script
**Security Disclaimer:** Running unsigned scripts poses a security risk! Please make sure any files you intent to give elevated permissions have been verified by you or someone you trust to be safe!

By default, you most likely won't be able to run the script directly. You may need to run a command that gives it temporary elevated permissions.

#### Run with elevated permissions
1. Open Powershell as admin and open the path that you the project is held in
2. Run the command below to give the script temporary eleveted permissions (read *Security Disclaimer* above first)
```
powershell -ExecutionPolicy Bypass -File main.ps1
```

#### Run normally from Powershell
1. Open Powershell as admin and open the path that you the project is held in
2. Run the Powershell script by running `./main.ps1`

# Please read!
This script (at least currently) doesn't get the latest file path for any future Discord updates. At this moment the program requires manual updating for every Discord update. So if the file path is out of date, create an [issue](https://github.com/Aethese/discord-anti-pauser/issues/new) or you can manually update it yourself.

## Discord installed on separate drive?
Unfortunately, the script doesn't support having Discord installed on a separate drive. However, you can try editing the file path in the script if you're comfortable doing so.
