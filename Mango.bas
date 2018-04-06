#Include Once "fbgfx.bi"
Using fb 
Type display 
	xWidth As ULong
	yHeight As ULong 
	depth As UByte '8,16,32)
End Type
Dim Shared display As display 
Dim Shared As image Ptr mainbuffer
Declare Sub parseScript 'this sub handles the parsing of scripts
Declare Sub renderOutput 'this sub combines framebuffers and renders the output to the screen
Declare Sub handleInput 'this sub handles the input coming in to the program
Declare Sub loadini 'this sub loads the ini
Declare Sub CAE 'cleanup and exit 

loadini
mainbuffer = ImageCreate(display.xWidth,display.yHeight,RGB(0,0,0))
ScreenRes display.xWidth,display.yHeight, display.depth 

'main loop
Do
	draw String mainbuffer, (Rnd*display.xWidth, Rnd*display.yHeight), "Boobs", RGB(200,0,200)
	Put (0,0),mainbuffer,PSet
   Sleep 1
Loop While Not MultiKey(SC_ESCAPE)
CAE

Sub loadini
	Dim As UByte f = FreeFile
	Open "options.ini"  For Input As #f 
	Input #f, display.xWidth
	Input #f, display.yHeight
	Input #f, display.depth
	Close #f
End Sub
 
Sub CAE
	Close
	If mainbuffer Then ImageDestroy(mainbuffer)
	end
End Sub
