#Requires AutoHotkey v2.0.2
#SingleInstance Force

; Ctrl (^), Alt (!), Shift (+) and Win (#).


GlazeWM(cmd) {
    RunWait(format("C:\Program Files\glzr.io\GlazeWM\glazewm.exe command {}", cmd), , "Hide")
}

KomorebiFocus(align) {
    if (align == 'left') {
        GlazeWM("focus left")
        GlazeWM("cycle-stack previous")
    } else if (align == 'right') {
        GlazeWM("focus right")
        GlazeWM("cycle-stack next")
    }
}

runApp(appNameOrPath) {
 If !FileExist(appNameOrPath) {
  For app in ComObject('Shell.Application').NameSpace('shell:AppsFolder').Items
   (app.Name = appNameOrPath) && RunWait('explorer shell:appsFolder\' app.Path)
 } Else Run(appNameOrPath)
}

; killCurrentProcess() {
;     WinKill
;     return
; }

#+q::WinClose("A")
#+w::runApp("WhatsApp")
#+m::GlazeWM("toggle-minimized")
; !+o::GlazeWM("wm-reload-config")
#+r::{
    GlazeWM("wm-reload-config")
    Reload
}
#+c::{
    GlazeWM("wm-reload-config")
    Reload
}

; Focus windows
#h::GlazeWM("focus --direction left")
#j::GlazeWM("focus --direction down")
#k::GlazeWM("focus --direction up")
#l::GlazeWM("focus --direction right")

; #Tab::GlazeWM("focus --next-workspace")
; #+Tab::GlazeWM("focus --prev-workspace")
#d::GlazeWM("focus --recent-workspace")
#w::GlazeWM("focus --recent-workspace")
#Tab::GlazeWM("focus --recent-workspace")


; #+[::GlazeWM("cycle-focus previous")
; #+]::GlazeWM("cycle-focus next")

; Move windows
#+h::GlazeWM("move --direction left")
#+j::GlazeWM("move --direction down")
#+k::GlazeWM("move --direction up")
#+l::GlazeWM("move --direction right")

; Stack windows
; #w::GlazeWM("stack-all")
; !Down::GlazeWM("stack down")
; !Up::GlazeWM("stack up")
; !Right::GlazeWM("stack right")
; !;::GlazeWM("unstack")
;![::GlazeWM("cycle-stack previous")
;!]::GlazeWM("cycle-stack next")

; Resize
; #=::GlazeWM("resize-axis horizontal increase")
; #-::GlazeWM("resize-axis horizontal decrease")
; #+=::GlazeWM("resize-axis vertical increase")
; #+_::GlazeWM("resize-axis vertical decrease")
#^l::GlazeWM("resize --width -2%")
#^h::GlazeWM("resize --width +2%")
#^k::GlazeWM("resize --height +2%")
#^j::GlazeWM("resize --height -2%")

; Manipulate windows
#+Space::GlazeWM("toggle-floating --centered")
#+f::GlazeWM("toggle-fullscreen")
#f::GlazeWM("toggle-fullscreen")

; Window manager optionr
#r::GlazeWM("wm-redraw")
; #p::GlazeWM("toggle-pause")

; Layouts
!x::GlazeWM("flip-layout horizontal")
!y::GlazeWM("flip-layout vertical")

; Workspaces
#1::GlazeWM("focus --workspace 1")
#2::GlazeWM("focus --workspace 2")
#3::GlazeWM("focus --workspace 3")
#4::GlazeWM("focus --workspace 4")
#5::GlazeWM("focus --workspace 5")
#6::GlazeWM("focus --workspace 6")
#7::GlazeWM("focus --workspace 7")
#8::GlazeWM("focus --workspace 8")


; Move windows across workspaces

#+1::{
    GlazeWM("move --workspace 1")
    GlazeWM("focus --workspace 1")
}
#+2::{
    GlazeWM("move --workspace 2")
    GlazeWM("focus --workspace 2")
}
#+3::{
    GlazeWM("move --workspace 3")
    GlazeWM("focus --workspace 3")
}
#+4::{
    GlazeWM("move --workspace 4")
    GlazeWM("focus --workspace 4")
}
#+5::{
    GlazeWM("move --workspace 5")
    GlazeWM("focus --workspace 5")
}
#+6::{
    GlazeWM("move --workspace 6")
    GlazeWM("focus --workspace 6")
}
#+7::{
    GlazeWM("move --workspace 7")
    GlazeWM("focus --workspace 7")
}
#+8::{
    GlazeWM("move --workspace 8")
    GlazeWM("focus --workspace 8")
}

; Start progrms

^!t::Run("wt")
; ^!t::Run("alacritty.exe")
; #+s::Run("cmd /c scrcpy.exe")
#+s::Run("C:\Users\lepto\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scoop Apps\scrcpy.lnk")
#n::Run("explorer.exe")
;^r::Reload



; InstallKeybdHook(1,1)
;
;
; global EnableDebug := 0
;
; global defaultWinBindKey:= "{F1}"
; global timeWait := 0.5
; global nonVisibleKeyList := ["Enter" , "Left" , "Right" , "UP" , "Down", "Backspace" , "Shift" ]
; global longTimePress := "{blind}{LWin}"
; global winHoldDownTime := 20
;
;
;
; LWin::{
;
;     fasterDefaultWinBindKey() ;test for faster bind
;
;
;     WinKeyDown_status := GetKeyState("Lwin" , "P") ; sotted to "P" because the hook mode
;
;     if WinKeyDown_status == 1{
;
;         afterWinKey := InputHook()
;         afterWinKey.KeyOpt("{ALL}", "E N")
;         afterWinKey.KeyOpt("{LCtrl}{RCtrl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}", "-E") ;{LWin}{RWin}
;
;
;         afterWinKey.Start()
;         ; fasterDefaultWinBindKey() ;test for faster bind ;disabled for better solution X12a
;
;         ;   SetTimer fasterDefaultWinBindKey_timer  disabled for better solution
;
;
;
;         afterWinKey.Wait(0.1)
;         global winHoldDownTime
;         global i := 0                                                                                      ;solution X12a
;         while (GetKeyState("LWin" ,"P") == 1) && afterWinKey.EndKey == "" && winHoldDownTime > i  {                  ;solution X12a
;             afterWinKey.Wait(0.1)
;             i++                                                                                   ;solution X12a
;         }
;
;         if i >= winHoldDownTime
;             {
;                 msgdebug("long key mode`n" ThisHotkey "`n" GetKeyState("LWin" ,"P"))
;                 SendInput longTimePress
;                 KeyWait("LWin", "L")
;                 while  GetKeyState("LWin" ,"P")==1{
;                     if  GetKeyState("LWin" ,"P")==0
;                         {
;                             msgdebug("exit whole winkey")
;                             exit
;                         }
;                 }
;                 Exit
;                 ; MsgBox
;                 ; exit ;issue bug-001
;             }
;         ; MsgBox "ss"
;
;     msgdebug("Not long mode")
;
;
;         winKeyCombo := afterWinKey.EndKey afterWinKey.EndMods
;
;         fasterDefaultWinBindKey() ;test for faster bind
;
;         switch winKeyCombo {           ; Migrating all glazewm script to here
;             case "Tab":
;                 GlazeWM("focus --recent-workspace")
;             case "1":
;                GlazeWM("focus --workspace 1")
;             case "2":
;                GlazeWM("focus --workspace 2")
;             case "3":
;                GlazeWM("focus --workspace 3")
;             case "4":
;                GlazeWM("focus --workspace 4")
;             case "5":
;                GlazeWM("focus --workspace 5")
;             case "6":
;                GlazeWM("focus --workspace 6")
;             case "7":
;                GlazeWM("focus --workspace 7")
;             case "8":
;                GlazeWM("focus --workspace 8")
;
;             case "1<+":
;                GlazeWM("move --workspace 1")
;             case "2<+":
;                GlazeWM("move --workspace 2")
;             case "3<+":
;                GlazeWM("move --workspace 3")
;             case "4<+":
;                GlazeWM("move --workspace 4")
;             case "5<+":
;                GlazeWM("move --workspace 5")
;             case "6<+":
;                GlazeWM("move --workspace 6")
;             case "7<+":
;                GlazeWM("move --workspace 7")
;             case "8<+":
;                GlazeWM("move --workspace 8")
;
;
;             case "q<+":
;                 WinClose("A")
;             default:
;
;                 msgdebug("this A_ahk: " A_ThisHotkey)
;                 local EndKey__Clean := afterWinKey.EndKey
;                 global nonVisibleKeyList
;                 loop nonVisibleKeyList.Length{
;                     EndKey__Clean := RegExReplace(EndKey__Clean, "i)" . nonVisibleKeyList[A_Index]  , ('{' . nonVisibleKeyList[A_Index] . '}'))
;                 }
;
;                 if EnableDebug == 1 {
;
;                     MsgBox( "you pressed " winKeyCombo
;                     "`n" 'is win pressed ' isWinKeyDown_status__string() '`n Realtime winkey down :'  GetKeyState("LWin" ,"P")
;                     "`nEnd__clean value :" EndKey__Clean
;                     )
;                     return
;
;                 }
;
;                 ; EndKey__Clean := RegExReplace(EndKey__Clean, "i)enter" ,"{Enter}")
;                 ; EndKey__Clean := RegExReplace(EndKey__Clean, "i)left" ,"{}")
;                 ;to see if there something wrong with your combo shortcut
;                 SendInput(EndKey__Clean) ; need "" to convert non-visable key like enter
;                 exit
;             }
;
;
;         isWinKeyDown_status__string(*){
;             local WinStatus__string := unset
;             switch GetKeyState("LWin" ,"P"){
;                 case 0:
;                     WinStatus__string := "No"
;                 case 1:
;                     WinStatus__string := "Yes"
;                 default:
;                     WinStatus__string := "Unknown"
;             }
;             return "is win key is down? :"  . WinStatus__string
;         }
;         ;break ;safe code to do the  defoult bind
;     }
;     else {
;         SendInput(defaultWinBindKey)
;     }
;
;
;     fasterDefaultWinBindKey(){ ;removed for better solution
;         ; if GetKeyState("Lwin" , "P") == 0{
;         ; SendInput(defaultWinBindKey)
;         ; Exit
;         ; }
;     }
;
;     fasterDefaultWinBindKey_timer(){
;         L := 1
;         while L == 1 {
;
;
;
;         if GetKeyState("Lwin" , "P") == 0{
;         ;SendInput(defaultWinBindKey)
;         ; MsgBox "set timer winsattus :" GetKeyState("Lwin" , "P")
;         SetTimer , 0
;         Exit
;         }else{
;             ; MsgBox "E12: " GetKeyState("Lwin" , "P")
;         }
;         }
; }
;
;
; }
;
;
;
; msgdebug(Text){
;     EnableDebug  ?? true
;
;     if EnableDebug == true {
;         MsgBox(text)
;     }
;
; }
