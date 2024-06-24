$discordPath = "$env:localappdata\Discord"
$directories = Get-ChildItem -Path $discordPath -Directory

$displayName = "Block Discord from contacting Spotify"
$description = "Blocks discord from contacting spotify so it can't pause your music. Created automatically by Discord Anti-Pauser."
$spotifyServerAddress = "35.186.224.24"

foreach ($dir in $directories)
{
    # checks if the directories
    $empty = (Get-ChildItem -Path $dir.FullName -Recurse -Directory | Measure-Object | Select-Object -ExpandProperty Count) -eq 0
    # if the directory isn't empty, it is the path in which Discord is stored in
    if (!($empty))
    {
        $fullDiscordPath = $discordPath + $dir + "\Discord.exe"
        Write-Host "Found Discord path at $fullDiscordPath"
        break
    }
}

# 2> $null redirects any errors to be sent to hell (null) so no stinky error pops up
$firewallRuleExists = Get-NetFirewallRule -DisplayName $displayName 2> $null
if ($firewallRuleExists)
{
    Write-Host "Removed old firewall rule"
    Remove-NetFirewallRule -DisplayName $displayName
}

New-NetFirewallRule -DisplayName $displayName -Description $description -Direction Outbound -LocalPort Any -RemoteAddress $spotifyServerAddress -Action Block -Program $fullDiscordPath
Write-Host "Created firewall rule"
