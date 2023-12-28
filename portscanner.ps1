# Simple port scanner in ps1
# Made by sp1d3rm0rph3us
# Intended do be used with a list of hosts and ports in an internal network
# Based on DESEC Security's ps1 portscanner

param($hostlist, $portlist)

$hosts = $(gc $hostlist)
$ports = $(gc $portlist)

if (!$hostlist -or !$portlist) {
	Write-Host "Usage: .\portscanner.ps1 [hostlist.file] [portlist.file]"

}
### MAIN CONDITION ###
else{
	# BANNER #
	Write-Host "//////////////////////////////////////////////////////////////////////////" -ForegroundColor Red
	Write-Host "////////////////// Obliterating your privacy, as usual ///////////////////" -ForegroundColor Red
	Write-Host "//////////////////////////////////////////////////////////////////////////" -ForegroundColor Red
	Write-Host "- By sp1d3rm0rph3us" -ForegroundColor Yellow

	foreach ($h in $hosts){
		foreach ($p in $ports){
			if (Test-NetConnection $h -Port $p -WarningAction SilentlyContinue -InformationLevel Quiet){
				Write-Host "[+] Found port $p open on $h" -ForegroundColor Green
			}
			else {
				Write-Host "[-] Port $p not responding on $h"
			}
		}
	}
}
