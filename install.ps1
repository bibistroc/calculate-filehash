$Root = $PSScriptRoot
$ScriptName = "Calculate-FileHash.ps1"
$RegFileName = "install-context-menu.reg"

$ScriptPath = (Join-Path $Root $ScriptName).Replace('\', '\\')
$RegFilePath = Join-Path $Root $RegFileName

$RegRootKey = "Hashing"
$TabTitle = "Hashing"
$MenuTitle = "Generate Hash"

function Show-Error {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Message,
        [Parameter(Mandatory=$false)]
        [int]
        $Code
    )
    Write-Host $Message -ForegroundColor Red
    
    if (!$Code) {
        $Code = 1
    }
    exit $Code
}

# Check if Windows Terminal (wt) is installed
if ($null -eq (Get-Command -Name "wt" -ErrorAction SilentlyContinue)) {
    Show-Error -Message "[Prerequisite Fail] Windows Terminal not installed or `"wt.exe`" is not in PATH" -Code 101
}

$command = "powershell"
if (Get-Command -Name "pwsh" -ErrorAction SilentlyContinue) {
    $command = "pwsh"
}

$regContent = Get-Content -Path $RegFilePath
$regContent = $regContent.Replace('[%RegKey%]', $RegRootKey)
$regContent = $regContent.Replace('[%TabTitle%]', $TabTitle)
$regContent = $regContent.Replace('[%command%]', $command)
$regContent = $regContent.Replace('[%ScriptPath%]', $ScriptPath)
$regContent = $regContent.Replace('[%MenuTitle%]', $MenuTitle)

$regContent | Out-File $RegFilePath