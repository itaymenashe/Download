# Define temp path and installer URL
$tempPath = "$env:TEMP\Win11Install"
$installerUrl = "https://download.microsoft.com/download/6/8/3/683178b7-baac-4b0d-95be-065a945aadee/Windows11InstallationAssistant.exe"
$installerPath = "$tempPath\Windows11InstallationAssistant.exe"

# Create temp directory if it doesn't exist
if (-not (Test-Path -Path $tempPath)) {
    New-Item -ItemType Directory -Path $tempPath | Out-Null
}

# Download the installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Run the installer silently
Start-Process -FilePath $installerPath -ArgumentList “/quietinstall /skipeula /auto upgrade” 

# Optional: Clean up
# Remove-Item -Path $tempPath -Recurse -Force
