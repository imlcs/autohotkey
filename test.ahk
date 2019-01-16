^k::   ;; !->alt键   ^->ctrl键 k->字母键k
Send {Up}   
return

^j::
Send {Down}
return

^h::
Send {Left}
return

^l::
Send {Right}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 鼠标放在任务栏时，滚动滚轮控制音量大小，中间键按下时关闭打开声音
; ctrl + 上键 或者 下键 控制音量大小
^Esc::SoundSet, +1, , mute
MouseIsOver(WinTitle) {
MouseGetPos,,, Win
return WinExist(WinTitle . " ahk_id " . Win)
}

WheelDown::
If (MouseIsOver("ahk_class Shell_TrayWnd"))
SoundSet,-1
Else
MouseClick,WD
Return

WheelUp::
If (MouseIsOver("ahk_class Shell_TrayWnd"))
SoundSet,+1
Else
MouseClick,WU
Return

MButton::
If (MouseIsOver("ahk_class Shell_TrayWnd"))
Send,{Volume_Mute}
Else
MouseClick,Middle
Return


^Up::Send {Volume_Up 1} ;Ctrl+上箭头 增加音量

^Down::Send {Volume_Down 1} ;Ctrl+下箭头 减少音量

^p::Send {Backspace}

Control::Capslock ; 把Control替换为Capslock 
Capslock::Control ; 把Capslock替换为Control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Win+Esc 关闭窗口
!Esc::Send !{F4}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^!c::  ;; Ctrl+alt+c 可拷贝文件路径
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return
