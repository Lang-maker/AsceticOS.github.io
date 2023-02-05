; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; 制作目标文件的模式	
[BITS 32]						; 制作32位模式用的机械语言


; 制作目标文件的信息

[FILE "naskfunc.nas"]			; 源文件名信息

		GLOBAL	_io_hlt			; 程序中包含的函数名       ; 全局函数
;函数名前要加“_”，这样可更好的与C语言函数链接，
;需要链接的函数名，都要用GLOBAL指令声明

; 以下是实际的函数

[SECTION .text]		; 目标文件中写了这些之后再写程序

_io_hlt:	; void io_hlt(void);
		HLT
		RET
