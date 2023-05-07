$destination = "C:\Users\$($env:USERNAME)\AppData\LocalLow\IronGate\Valheim\worlds_local"
if (-not (Test-Path $destination)) {
    New-Item -ItemType Directory -Path $destination | Out-Null
}

Add-Type -AssemblyName System.Windows.Forms
$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.Multiselect = $true
$dialog.ShowDialog() | Out-Null

foreach ($file in $dialog.FileNames) {
    Copy-Item -Path $file -Destination $destination -Force
}