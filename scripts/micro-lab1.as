USING 0 ; Use register bank 0
ORG 0h
Jmp Start ; Start of the program
ORG 03h
LJmp Ext0Srv ; Handler address EXT INT0
ORG 0BH ; Handler address TIMER INT 0
LJmp Time0Srv ;
ORG 13H ; Handler address EXT INT 1
LJmp Ext1Srv ;
ORG 1BH ; Handler address TIMER INT 1
LJmp Time1Srv ;
ORG 23H ; Interrupt handler address from
LJmp RiTiSrv ; Serial port
; --- End of header ----
Start:

MOV R0, #0x20 ; Address of the current array element
MOV R1, #0x20 ; Address of the current minimum element
MOV R2, #0x0A ; Iteration counter

MOV 0x20, #0x36 ; Initializing memory
MOV 0x21, #0x2F
MOV 0x22, #0x35
MOV 0x23, #0xE8
MOV 0x24, #0xBA
MOV 0x25, #0x6A
MOV 0x26, #0x21
MOV 0x27, #0x33
MOV 0x28, #0xAB
MOV 0x29, #0x45
Loop1:	
	MOV A, @R1  ;Compare current and minimum elements
	SUBB A, @R0
	JC NotMin
	MOV A, R0
	MOV R1, A
NotMin:
	INC R0
	DJNZ R2, Loop1
	MOV A, R1
Loop:
	SJMP Loop
; Interrupt handlers
Ext1Srv: RETI
Time0Srv: RETI
Time1Srv: RETI
RiTiSrv: RETI
Ext0Srv: RETI
RetIE0: RETI
END
