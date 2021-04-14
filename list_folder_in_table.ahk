; recursively lists all files in a folder in a table with sortable headers
; original source by Garry
; https://autohotkey.com/board/topic/55793-sort-by-date-modified-folder-view/
;

TMR=P:\phi\obsidian\obsdn-vault      ;------ folder search from here
ifnotexist,%tmr%
  {
  Msgbox, the folder %tmr% not exist
  exitapp
  }

;Gui,2: +Resize +MaximizeBox 
Gui,2:default
Gui,2:Font,  S10 CDefault , Consolas

SW=%A_screenwidth%
SH=%A_screenheight%
GSW:=(SW*90)/100
GSH:=(SH*90)/100
LSW:=(SW*80)/100
LSH:=(SH*55)/100

T1:=(SW*18 )/100   ;NAME
T2:=(SW*9 )/100   ;PATH
T3:=(SW*4  )/100   ;SIZE
T4:=(SW*8 )/100   ;Created
T5:=(SW*8 )/100   ;Accessed
T6:=(SW*8 )/100   ;Modified
T7:=(SW*10  )/100   ;FULLPATH

T1A:=T1
T2A:=T1+T2
T3A:=T1+T2+T3
T4A:=T1+T2+T3+T4
T5A:=T1+T2+T3+T4+T5
T6A:=T1+T2+T3+T4+T5+T6
T7A:=T1+T2+T3+T4+T5+T6+T7

Gui, 2:Add, ListView, grid x0 y0 w%T7A% h%LSH% altsubmit vA1 gA2, Name|FOLDER|Size|Created|LastAccess|Modified|FullPath

LV_ModifyCol(1,T1)
LV_ModifyCol(2,T2)
LV_ModifyCol(3,T3)
LV_ModifyCol(4,T4)
LV_ModifyCol(5,T5)
LV_ModifyCol(6,T6)
LV_ModifyCol(7,T7)

LV_ModifyCol(3,"Integer")
LV_ModifyCol(4,"digit")
LV_ModifyCol(5,"digit")
LV_ModifyCol(6,"digit")

gosub,filllist

Gui,2: Show, x131 y131, %TMR% +hscroll 

LV_ModifyCol(5, "Sort")       ; --- sort column modified
return
;---------------------------------------------------------------------

;-----------------
Filllist:
Gui,2:submit,nohide
Gui,2:ListView,A1
LV_Delete()
Loop, %tmr%\*.*, 0, 1
    {
       I4++
       CX=
       C=
       D=
       O=
       P:=0
       Q:=0
       R:=0
       S:=0
       T=
       O=%A_LoopFileName%
       P=%A_LoopFileSize%
       Q=%A_LoopFileTimeCreated%
       R=%A_LoopFileTimeAccessed%
       S=%A_LoopFileTimeModified%
       T=%A_LoopFileFullPath%

       StringSplit,CX, T,`\
       C:=(CX0-1)   ; path oneflashback
       D=% CX%C%    ; name from path position -1
       LV_Add("",O,D,P,Q,R,S,T)
     }

LV_Modify(LV_GetCount(), "Vis")    ;jumps to last row
return
;---------------------------------------------------------------------




;--------------------------------------------------------------------
2GuiClose:
Gui,2:submit,nohide
exitapp
;---------------------------------------------------------------------


;----------------  LISTVIEW ----------------------------
A2:
Gui,2:default
Gui,2:ListView,A1

     RN:=LV_GetNext("C")  ;2  selected checked
     RF:=LV_GetNext("F")  ;2  selected focused
     GC:=LV_GetCount()    ;4  total


if A_GuiEvent = Normal
{
MouseGetPos,x,y
 {
if x<%T1A%
   {
   LV_GetText(C7,A_EventInfo,7)
   GuiControl,2:Text,I2,%RF%
   GuiControl,2:Text,I4,%C7%
   return
   }

if x<%T2A%
   {
   LV_GetText(C7,A_EventInfo,7)
   SplitPath,C7,name, dir, ext, name_no_ext, drive
   run,%dir%
   return
   }

if x<%T3A%
   {
   LV_GetText(C7,A_EventInfo,7)
   return
   }

if x<%T4A%
   {
   LV_GetText(C7,A_EventInfo,7)
   return
   }

if x<%T5A%
   {
   LV_GetText(C7,A_EventInfo,7)
   return
   }

if x<%T6A%
   {
   LV_GetText(C7,A_EventInfo,7)
   return
   }

if x<%T7A%
   {
   LV_GetText(C7,A_EventInfo,7)
   return
   }

 }
}


   if A_GuiEvent=Rightclick
     {
     LV_GetText(C7,A_EventInfo,7)
     SplitPath,C7,name, dir, ext, name_no_ext, drive
     exxx=txt,htm,html,hta,ahk,bas,ini,log,ram,pls,inf,ver
     If ext in %exxx%
        {
        ifexist,%c7%
          run,notepad.exe "%c7%"
        return
        }
     return
     }


   if A_GuiEvent=Doubleclick
     {
     LV_GetText(C1,A_EventInfo,1)
     LV_GetText(C7,A_EventInfo,7)
     SplitPath,C7,name, dir, ext, name_no_ext, drive
     exxx=exe,bat,com,dll
     If ext in %exxx%
        {
        msgbox, 262436,RUN ,Want you really Start program %c1% ?
        ifmsgbox,No
           return
        }
     ifexist,%c7%
         run,%c7%
     return
     }

return
;============================= end listview ==========