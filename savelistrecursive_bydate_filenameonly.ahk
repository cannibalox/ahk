FileList := ""
Loop, Files, P:\phi\obsidian\obsdn-vault\*.*, R FD ; Include Files and Directories
    FileList .= A_LoopFileTimeModified "`t" A_LoopFileName "`n"
Sort, FileList, R  ; Sort by date.reversed
Loop, Parse, FileList, `n
{
    if (A_LoopField = "")  ; Omit the last linefeed (blank item) at the end of the list.
        continue
    StringSplit, FileItem, A_LoopField, %A_Tab%  ; Split into two parts at the tab char.
    ; FileItem1 is FileTimeModified and FileItem2 is FileFullPath
If not ErrorLevel
FileAppend, %FileItem2%`n, MyList1.txt
}
Run, MyList1.txt
