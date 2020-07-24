# ahk

scripts for AutoHotkey https://www.autohotkey.com/

__**alwaysontop-ALTF12.ahk**__ : keeps the window always on top with ALT F12

__**odsbn-autosnipp.ahk**__ : for use with Obsidian.md.<br>
a quick way to create reference blocks/transclusions from text selection with CTRL SHIFT X / CTRL V.<br>
# **HOW :**<br>
select a block of text and use CTR+SHIFT+X (or CTRL+SHIFT+C for copy) to cut the selected text into a NEW FILE in the /snippets directory of your vault (create the folder beforehand to avoid problems). The file will be named in the format : `yourvault/snippets/yyyyMM/xx_yyyyMMhhmmss-msec_%sourcewindowtitle%.md` and the link to the file is put in the clipboard, ready to be pasted in place or elsewhere.<br>
# **WHY :**<br>
since Obsidian doesn't have block-level transclusions, this is a quick hack to get the same functionnality, but manually. Select your text, hit the shortcut, the selection is now a file that can be referrenced elsewhere and modified, thus making `clones` or `instances`.<br>
  
  ![](https://forum.obsidian.md/uploads/default/original/2X/c/cb2bca62fee317a2f69c56c617e8cece69a6b1ae.gif)
  
  https://forum.obsidian.md/t/block-reference/674/114
