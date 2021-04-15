FileList := ""
Loop, Files, P:\phi\obsidian\obsdn-vault\*.*, R FD  ; Include Files and Directories
    FileList = %FileList%%A_LoopFileTimeModified%`t%A_LoopFileFullPath%`n
Sort, FileList, R  ; sort by modification date in reverse order
Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Omit the last linefeed (blank item) at the end of the list.
        continue   
    StringSplit, FileItem, A_LoopField, %A_Tab%  ; Split the list items at the tab character
    ; FileItem1 is FileTimeModified and FileItem2 is FileFullPath
If not ErrorLevel
FileAppend, %FileItem2%`n, MyList2.txt
}
Run, MyList2.txt

