$discordPath = "%USERPROFILE%\AppData\Local\Discord\app-1.0.9151\Discord.exe"
$displayName = "Block Discord from contacting Spotify"

$firewallRuleExists = Get-NetFirewallRule -DisplayName $displayName
if ($firewallRuleExists)
{
	Write-Host "Removed old firewall rule"
	Remove-NetFirewallRule -DisplayName $displayName
}

New-NetFirewallRule -DisplayName $displayName -Description "Blocks discord from contacting spotify so it can't pause your music. Created automatically by Discord Anti-Pauser." -Direction Outbound -LocalPort Any -RemoteAddress "35.186.224.24" -Action Block -Program $discordPath
Write-Host "Created firewall rule"
