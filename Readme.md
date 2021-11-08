# Windows hashing context menu

## Prerequisites
- Windows terminal
- PowerShell Core (pwsh)

Registry values:
```powershell
wt -w 0 nt --title "Hashing" pwsh -ExecutionPolicy Unrestricted "%userprofile%\PowerShell\calculate.ps1" -Algorithm SHA1 -Path "%1"
wt -w 0 nt --title "Hashing" pwsh -ExecutionPolicy Unrestricted "%userprofile%\PowerShell\calculate.ps1" -Algorithm SHA256 -Path "%1"
wt -w 0 nt --title "Hashing" pwsh -ExecutionPolicy Unrestricted "%userprofile%\PowerShell\calculate.ps1" -Algorithm SHA384 -Path "%1"
wt -w 0 nt --title "Hashing" pwsh -ExecutionPolicy Unrestricted "%userprofile%\PowerShell\calculate.ps1" -Algorithm SHA512 -Path "%1"
wt -w 0 nt --title "Hashing" pwsh -ExecutionPolicy Unrestricted "%userprofile%\PowerShell\calculate.ps1" -Algorithm MD5 -Path "%1"
wt -w 0 nt --title "Hashing" pwsh -ExecutionPolicy Unrestricted "%userprofile%\PowerShell\calculate.ps1" -Path "%1"
```