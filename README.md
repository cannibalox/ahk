# AHK scripts

scripts for AutoHotkey https://www.autohotkey.com/

## alwaysontop-ALTF12.ahk : 
keeps the window always on top with ALT F12

## odsbn-autosnipp.ahk : 
For use with **Obsidian.md**. **this works best with [AutoHotkey ANSI]((https://www.autohotkey.com/download/1.1/AutoHotkey_1.1.33.02.zip)) (AutoHotkeyA32.exe) for better accented characters support. **<br>
a quick way to create reference blocks/transclusions from text selection with CTRL SHIFT X / CTRL V.<br>
### HOW:
select a block of text and use CTR+SHIFT+X (or CTRL+SHIFT+C for copy) to cut the selected text into a NEW FILE in the /snippets directory of your vault (create the folder beforehand to avoid problems). The file will be named in the format :<br> `yourvault/snippets/yyyyMM/xx_yyyyMMhhmmss-msec_%sourcewindowtitle%.md` and the link to the file is put in the clipboard, ready to be pasted as an Obsidian transclusion (with the format `![[%yourfile%]]`).<br>
### WHY:
since Obsidian doesn't have block-level transclusions, this is a quick hack to get the same functionnality, but manually. Select your text, hit the shortcut, the selection is now a file that can be referenced elsewhere and modified, thus making `clones` or `instances`.<br>
  
  ![](https://forum.obsidian.md/uploads/default/original/2X/c/cb2bca62fee317a2f69c56c617e8cece69a6b1ae.gif)
  
  https://forum.obsidian.md/t/block-reference/674/114
