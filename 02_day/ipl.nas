; hello-os
; TAB=4

		ORG		0x7c00			; ָ�������װ�ص�ַ origin

; ���µļ������ڱ�׼FAT12��ʽ������

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; 启动扇区名称�?字节�?		DW		512				; 每个扇区（sector）大小（必须512字节�?		DB		1				; 簇（cluster）大小（必须�?个扇区）
		DW		1				; FAT起始位置（一般为第一个扇区）
		DB		2				; FAT个数（必须为2�?		DW		224				; 根目录大小（一般为224项）
		DW		2880			; 该磁盘大小（必须�?880扇区1440*1024/512�?		DB		0xf0			; 磁盘类型（必须为0xf0�?		DW		9				; FAT的长度（�??9扇区�?		DW		18				; 一个磁道（track）有几个扇区（必须为18�?		DW		2				; 磁头数（�??2�?		DD		0				; 不使用分区，必须�?
		DD		2880			; 重写一次磁盘大�?		DB		0,0,0x29		; 意义不明（固定）
		DD		0xffffffff		; （可能是）卷标号�?		DB		"HELLO-OS   "	; 磁盘的名称（必须�?1�?，不足填空格�?		DB		"FAT12   "		; 磁盘格式名称（必??8�?，不足填空格�?		RESB	18				; 先空�?8字节

; �������

entry:
		MOV		AX,0			; ��ʼ���Ĵ���
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; 给SI�?
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; 显示一个文�?		MOV		BX,15			; 指定字符颜色
		INT		0x10			; 调用显卡BIOS
		JMP		putloop
fin:
		HLT						; 让CPU停止，等待指�?		JMP		fin				; 无限循环

msg:
		DB		0x0a, 0x0a		; 换行两次
		DB		"hello, world"
		DB		0x0a			; 换行
		DB		0

		RESB	0x7dfe-$		; 填写0x00直到0x001fe

		DB		0x55, 0xaa
