#include <MsgBoxConstants.au3>

; Appuyez sur Echap pour terminer le script, Pause/Break pour "pause"

Global $g_bPaused = False, $g_bStop = False

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("+{ESC}", "Terminate")
HotKeySet("+?", "ShowMessage")  ; Shift-Alt-d
HotKeySet("+{PGUP}", "shiftLeft")
HotKeySet("+{PGDN}", "shiftRight")

While Not $g_bStop
    Sleep(100)
WEnd

Func TogglePause()
   $g_bPaused = Not $g_bPaused
   if $g_bPaused == False Then
	  ToolTip('', 0, 0)
   else
	  ToolTip('Script en "Pause"', 0, 0)
   EndIf
EndFunc   ;==>TogglePause

Func Terminate()
   $g_bStop = True
EndFunc   ;==>Terminate

Func ShowMessage()
   if $g_bPaused == False Then
	  MsgBox($MB_SYSTEMMODAL, "", "Toujours fonctionnel"& @CRLF & @CRLF&"Shift + ↑ = >"&@CRLF&"Shift + ↓ = <"&@CRLF&"Shift + ? = help"&@CRLF&"pause = mettre en pause"&@CRLF&"Shift + ESC = fin du script")
   EndIf
EndFunc   ;==>ShowMessage

Func shiftLeft()
   if $g_bPaused == False Then
	  send("<")
   EndIf
EndFunc

Func shiftRight()
   if $g_bPaused == False Then
	  send(">")
   EndIf
EndFunc