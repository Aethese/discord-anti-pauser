# Spotify Anti-Pauser
Uses the power of the Windows firewall to block Discord from pausing Spotify if your mic has been on for around 30 seconds straight.

# Installation
Download this project as a Zip by clicking on Code -> Download Zip (example picture below). After unzipping the project in your preferred location, head to step 2, "Running script"
![download instructions](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fhelpdeskgeek.com%2Fwp-content%2Fpictures%2F2021%2F06%2F11CodeButtonDownloadZip.png&f=1&nofb=1&ipt=dbc33612dfeecd66a18ef3f5299f698fa2112bc7e3b31a079e29bc38f7893ba9&ipo=images)

## Running script
You may be able to run the script by just calling the script as admin in Powershell by running: `./main.ps1`

However, if you have default execution policy, you should be able to run it by giving it temporary permissions by running this as admin in Powershell:
```
powershell -ExecutionPolicy Bypass -File main.ps1
```

# Please read!
This script (at least currently) doesn't get the latest file path for any future updates. At this moment the program requires manual updating for every Discord update. So if the file path is out of date, create an [issue](https://github.com/Aethese/discord-anti-pauser/issues/new)

## Discord installed on separate drive?
Unfortunately I don't support that, but it should be easy to edit the path in the file if you need that lol
