import-module servermanager
add-windowsfeature web-server -includeallsubfeature
Add-WindowsFeature Web-Server
Set-Content -Path "C:\inetpub\wwwroot\Default.html" -Value "This is the server $($env:computername) !"
