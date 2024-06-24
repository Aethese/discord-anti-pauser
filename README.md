# Spotify Anti-Pauser
Uses the power of the Windows firewall to block Discord from pausing Spotify if your mic has been on for around 30 seconds straight.

## Running script
If you can't run the script because of your local execution policy, you may be able to run it by giving it temporary permissions by running this as admin in Powershell:
```
powershell -ExecutionPolicy Bypass -File main.ps1
```

## Please read!
This script (at least currently) doesn't get the latest file path for any future updates. At this moment the program requires manual updating, so if the file path is out of date, create an [issue](https://github.com/Aethese/discord-anti-pauser/issues/new)

### Discord installed on separate drive?
Unfortunately I don't support that, but it should be easy to edit the path in the file if you need that lol
