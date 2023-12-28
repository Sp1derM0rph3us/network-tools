### SWEEPTHEM ###
# A ping simple ping sweep script, now also in ps1 format :)
# Made by sp1d3rm0rph3us
param($ip)

if (!$ip){
	echo "Usage: .\sweepthem 192.168.0"
}
else{
	Write-Host "╔════════════════════════════════════════════════╗" -ForegroundColor Yellow
	Write-Host "║           SWEEPTHEM by sp1d3rm0rph3us          ║" -ForegroundColor Yellow
	Write-Host "╚════════════════════════════════════════════════╝" -ForegroundColor Yellow
	Write-Host ""
	Write-Host "- Obliterating your privacy, as usual." -ForegroundColor Red
	foreach ($x in 1..254) {
		if (ping -n 1 "$ip.$x" | Select-String "bytes=32"){
			Write-Host "[+] Found $ip.$x" -ForegroundColor Green
		}
	}
}
