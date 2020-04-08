#NoEnv
#SingleInstance, force
Run, taskmgr.exe
MsgBox, Enjoy
Loop, 32768
{
  pid := A_Index
  h := DllCall("kernel32.dll\OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
  DllCall("kernel32.dll\SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
  DllCall("psapi.dll\EmptyWorkingSet", "Int", h)
  DllCall("CloseHandle", "Int", h)
}
Sleep, 5000
Exitapp

