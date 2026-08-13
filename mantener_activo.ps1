Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class SleepPreventer {
    [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern uint SetThreadExecutionState(uint esFlags);

    public const uint ES_CONTINUOUS       = 0x80000000;
    public const uint ES_SYSTEM_REQUIRED  = 0x00000001;
    public const uint ES_DISPLAY_REQUIRED = 0x00000002;
}
"@

$flags = [SleepPreventer]::ES_CONTINUOUS -bor [SleepPreventer]::ES_SYSTEM_REQUIRED -bor [SleepPreventer]::ES_DISPLAY_REQUIRED
[SleepPreventer]::SetThreadExecutionState($flags) | Out-Null

Write-Host "Computadora protegida contra suspension. Presiona Ctrl+C para detener."

try {
    while ($true) {
        Start-Sleep -Seconds 60
    }
} finally {
    [SleepPreventer]::SetThreadExecutionState([SleepPreventer]::ES_CONTINUOUS) | Out-Null
    Write-Host "Proteccion desactivada."
}
