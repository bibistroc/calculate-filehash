param(
    [Parameter(Mandatory=$true)][string]$Path,
    [Parameter(Mandatory=$false)]
    [ValidateSet("SHA1","SHA256","SHA384","SHA512","MD5")]
    [string]$Algorithm
)

if (!$Algorithm) {
    $hash = @()
    "SHA1","SHA256","SHA384","SHA512","MD5" | ForEach-Object {
        $hash += Get-FileHash -Algorithm $_ -Path $Path
    }
    $hash | Format-Table -Property Algorithm,Hash -Wrap
    Pause
    return
}

$hash = Get-FileHash -Algorithm $Algorithm -Path $Path
$hash | Format-Table -Property Algorithm,Hash -Wrap

Write-Host "`nPress [ENTER] to exit or input a value to compare"
$value = Read-Host "Hash"

if (!$value) {
    return
}

if ($value -eq $hash.Hash) {
    Write-Host "EQUAL" -ForegroundColor Green
} else {
    Write-Host "NOT EQUAL" -ForegroundColor Red
}
Pause