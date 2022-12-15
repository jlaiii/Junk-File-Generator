Write-Output "Welcome to the Junk File Generator!"
sleep 3
$ErrorActionPreference = 'SilentlyContinue'
$junkFolder = "$PSScriptRoot\junk"
New-Item -ItemType Directory -Path $junkFolder

while($true) {
    $filePath = "$junkFolder\junkfile$(Get-Random).junk"
    $junkData = New-Object byte[] (100MB)
    try {
        [System.IO.File]::WriteAllBytes($filePath, $junkData)
        Write-Output "Created junk file: $filePath"
    } catch {
		Write-Host "Drive Full. Test done."
        $null = Read-Host
		
    }
}
