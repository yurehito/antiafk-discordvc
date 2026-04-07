# Anti-AFK Discord Script (AHK v1)

> Simple script to keep Discord from going idle while you're AFK using key and mouse

### 🚀 Setup

i) Install AutoHotkey (v1) <br>
ii) Create a new `.ahk` file <br>
iii) Paste the script code <br>
iv) Double-click to run <br>

### ⌚ Change Timing

> Edit these lines (time is in milliseconds):

```ahk
IdleThreshold := 58000   ; when it triggers (58 sec)
CheckInterval := 1000    ; how often it checks
```

### 🧩 What You Can Tweak

i) IdleThreshold → how long before it acts <br>
ii) CheckInterval → how frequently it checks <br>
iii) Keys used (Shift, Ctrl, etc.) <br>
iv) Mouse movement range <br>
v) Mouse vs keyboard usage ratio <br>
vi) Discord process names (if needed) <br>
vii) Ctrl + Alt + S → Toggle ON/OFF <br>

### 📌 Note

> **The script only runs when Discord is open. It does nothing while you're active (moving mouse or pressing keys).**
