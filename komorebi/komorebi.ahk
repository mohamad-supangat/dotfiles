#Requires AutoHotkey v2.0.2
#SingleInstance Force

; Ctrl (^), Alt (!), Shift (+) and Win (#).


Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

KomorebiFocus(align) {
    if (align == 'left') {
        ; Komorebic("focus left")
        Komorebic("cycle-stack previous")
    } else if (align == 'right') {
        ; Komorebic("focus right")
        Komorebic("cycle-stack next")
    }
}

ReloadAll() {
    Komorebic("reload-configuration")
    Komorebic("stop --bar")
    Komorebic("start --ahk")
    Reload
}

runApp(appNameOrPath) {
 If !FileExist(appNameOrPath) {
  For app in ComObject('Shell.Application').NameSpace('shell:AppsFolder').Items
   (app.Name = appNameOrPath) && RunWait('explorer shell:appsFolder\' app.Path)
 } Else Run(appNameOrPath)
}


#+q::Komorebic("close")
#+m::Komorebic("minimize")
; !+o::Komorebic("reload-configuration")
#+r::ReloadAll()

; Focus windows
; #h::KomorebiFocus("left")
#h::Komorebic("focus left")
#j::Komorebic("focus down")
#k::Komorebic("focus up")
; #l::KomorebiFocus("right")
#l::Komorebic("focus right")
#Tab::KomorebiFocus("right")
#w::KomorebiFocus("right")
#+Tab::KomorebiFocus("left")

#+[::Komorebic("cycle-focus previous")
#+]::Komorebic("cycle-focus next")

; Move windows
#+h::Komorebic("move left")
#+j::Komorebic("move down")
#+k::Komorebic("move up")
#+l::Komorebic("move right")

; Stack windows
^!w::Komorebic("stack-all")
!Down::Komorebic("stack down")
!Up::Komorebic("stack up")
!Right::Komorebic("stack right")
!;::Komorebic("unstack")
;![::Komorebic("cycle-stack previous")
;!]::Komorebic("cycle-stack next")

; Resize
#=::Komorebic("resize-axis horizontal increase")
#-::Komorebic("resize-axis horizontal decrease")
#+=::Komorebic("resize-axis vertical increase")
#+_::Komorebic("resize-axis vertical decrease")

; Manipulate windows
#+Space::Komorebic("toggle-float")
#+f::Komorebic("toggle-monocle")
#f::Komorebic("toggle-monocle")

; Window manager optionr
#r::Komorebic("retile")
; #p::Komorebic("toggle-pause")

; Layouts
!x::Komorebic("flip-layout horizontal")
!y::Komorebic("flip-layout vertical")

; Workspaces
#1::Komorebic("focus-workspace 0")
#2::Komorebic("focus-workspace 1")
#3::Komorebic("focus-workspace 2")
#4::Komorebic("focus-workspace 3")
#5::Komorebic("focus-workspace 4")
#6::Komorebic("focus-workspace 5")
#7::Komorebic("focus-workspace 6")
#8::Komorebic("focus-workspace 7")

; Move windows across workspaces
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")


; Start progrms

^!t::Run("wt")
; ^!t::Run("alacritty.exe")
; ^!t::Run("wezterm.exe")

; #+s::Run("cmd /c scrcpy.exe")
#+s::Run("C:\Users\lepto\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scoop Apps\scrcpy.lnk")
#+w::runApp("WhatsApp")
#n::Run("explorer.exe")
