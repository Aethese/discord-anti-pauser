# check if admin because we require elevated permissions
#Requires -RunAsAdministrator

$discordPath = "$env:localappdata\Discord"
$directories = Get-ChildItem -Path $discordPath -Directory

$currentDate = (Get-Date).ToString("yyyy/MM/dd")
$displayName = "Block Discord from contacting Spotify"
$description = "Blocks discord from contacting spotify so it can't pause your music. Created automatically by Discord Anti-Pauser at $currentDate."
$spotifyServerAddress = "35.186.224.24"

foreach ($dir in $directories)
{
    # checks if the child count of a directory is equal to 0
    $empty = (Get-ChildItem -Path $dir.FullName -Recurse -Directory | Measure-Object | Select-Object -ExpandProperty Count) -eq 0

    # if the directory isn't empty, it is the path in which Discord is stored in
    if (!($empty))
    {
        $fullDiscordPath = $discordPath + "\" + $dir + "\Discord.exe"
        Write-Host "Found Discord path at $fullDiscordPath"
        break
    }
}

if (-not $fullDiscordPath)
{
    Write-Warning "Could not find Discord.exe!"
    exit
}

# 2> $null redirects any errors to be sent to hell (null) so no stinky error pops up
$firewallRuleExists = Get-NetFirewallRule -DisplayName $displayName 2> $null
if ($firewallRuleExists)
{
    Remove-NetFirewallRule -DisplayName $displayName
    Write-Host "Removed old firewall rule"
}

New-NetFirewallRule -DisplayName $displayName -Description $description -Direction Outbound -LocalPort Any -RemoteAddress $spotifyServerAddress -Action Block -Program $fullDiscordPath

# NOTE: sometimes LocalPort causes issues, so I am no offering a solution that doesn't use it. this temp solution can be seen below
#New-NetFirewallRule -DisplayName $displayName -Description $description -Direction Outbound -RemoteAddress $spotifyServerAddress -Action Block -Program $fullDiscordPath

Write-Host "Created firewall rule"
