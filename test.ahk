; C:\Users\lcs\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

^k::   ;; # -> Win键   !->alt键   ^->ctrl键 k->字母键k
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

; Control::Capslock ; 把Control替换为Capslock 
; Capslock::Control ; 把Capslock替换为Control
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


#=:: ;窗口透明化增加或者减弱
    WinGet, ow, id, A
    WinTransplus(ow)
    return

#-:: ;窗口透明化增加或者减弱
    WinGet, ow, id, A
    WinTransMinus(ow)
    return
WinTransplus(w){
 
    WinGet, transparent, Transparent, ahk_id %w%
    if transparent < 255
        transparent := transparent+10
    else
        transparent =
    if transparent
        WinSet, Transparent, %transparent%, ahk_id %w%
    else
        WinSet, Transparent, off, ahk_id %w%
    return
}
WinTransMinus(w){
 
    WinGet, transparent, Transparent, ahk_id %w%
    if transparent
        transparent := transparent-10
    else
        transparent := 240
    WinSet, Transparent, %transparent%, ahk_id %w%
    return
}



#enter:: ;最大化窗口
WinGet,S,MinMax,A
if S=0
    WinMaximize,A
else if S=1
    WinRestore,A
else if S=-1
    WinRestore,A
return

!enter:: ;最爱代码之窗口置顶
    WinGet ow, id, A
    WinTopToggle(ow)
    return
WinTopToggle(w) {
 
    WinGetTitle, oTitle, ahk_id %w%
    Winset, AlwaysOnTop, Toggle, ahk_id %w%
    WinGet, ExStyle, ExStyle, ahk_id %w%
    if (ExStyle & 0x8)  ; 0x8 为 WS_EX_TOPMOST.在WinGet的帮助中
        oTop = 置顶
    else
        oTop = 取消置顶
    tooltip %oTitle% %oTop%
    SetTimer, RemoveToolTip, 5000
    return
 
    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}

;快捷键 alt + y 打开百度网盘
!x::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Xshell 6\Xshell.lnk

!a:: ; 阿里云
run https://homenew.console.aliyun.com/home/dashboard/Operation
sleep 2000
tooltip,
return

!b:: ; bilibili
run https://www.bilibili.com
sleep 2000
tooltip,
return

;google搜索
;=========================================================
!g:: ;用google搜索剪切板的内容
run https://www.google.com/search?q=%clipboard%
sleep 2000
tooltip,
return
