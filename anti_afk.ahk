; anti_afk.ahk

#NoEnv
SendMode Input
SetBatchLines -1
SetWorkingDir %A_ScriptDir%

; ---------- USER SETTINGS ----------
IdleThreshold := 58000
CheckInterval := 1000
DiscordProcesses := ["Discord.exe","DiscordCanary.exe","DiscordPTB.exe"]
; -----------------------------------

running := true
lastActionTick := 0

SetTimer, AntiAFK, %CheckInterval%
Menu, Tray, Tip, Anti-AFK Optimized — Ctrl+Alt+S to toggle

^!s::
running := !running
TrayTip, Anti-AFK, % running ? "Running" : "Paused", 1
return

AntiAFK:
    if (!running)
        return

    if (!IsDiscordRunning())
        return

    idle := A_TimeIdlePhysical

    if (idle < IdleThreshold)
        return

    if (A_TickCount - lastActionTick < IdleThreshold)
        return

    PerformSmartAction()
    lastActionTick := A_TickCount
return

; ---------- SMART ACTION ----------
PerformSmartAction()
{
    Random, roll, 1, 100

    ; 70% mouse, 30% keyboard
    if (roll <= 70)
    {
        Random, dx, 1, 4
        Random, dy, -2, 2
        DllCall("mouse_event", "UInt", 0x0001, "Int", dx, "Int", dy, "UInt", 0, "UInt", 0)
        Sleep, 40
        DllCall("mouse_event", "UInt", 0x0001, "Int", -dx, "Int", -dy, "UInt", 0, "UInt", 0)
    }
    else
    {
        keys := ["Shift","Ctrl"]
        Random, k, 1, % keys.MaxIndex()
        key := keys[k]
        Send, {%key%}
    }

    ; small random delay (anti-pattern)
    Random, extra, 200, 800
    Sleep, %extra%
}

; ---------- PROCESS CHECK ----------
IsDiscordRunning()
{
    global DiscordProcesses
    for _, proc in DiscordProcesses
    {
        Process, Exist, %proc%
        if (ErrorLevel)
            return true
    }
    return false
}
