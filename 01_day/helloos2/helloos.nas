; hello-os
; TAB=4

; 以下是这段标准FAT12格式软盘专用代码
		DB		0xeb, 0x4e, 0x90
		DB		"HELLOIPL"		; 启动区的名称，可以是任意字符(8字节)
		DW		512				; 每个扇区(sector)的大小(必须为512字节)
		DB		1				; 簇(cluster)的大小(必须为一个扇区)
		DW		1				; FAT的起始位置(一般从第一个扇区开始)
		DB		2				; FAT的个数
		DW		224				; 根目录的大小(一般为224项)
		DW		2880			; 该磁盘的大小(必须是2880扇区)
		DB		0xf0			; 磁盘的种类
		DW		9				; FAT的长度(必须是9扇区)
		DW		18				; 1个磁道（track）上有几个扇区（必须为18个）
		DW		2				; 磁头数（必须是2）
		DD		0				; 不使用分区，必须是0
		DD		2880			; 重写磁盘大小
		DB		0,0,0x29		; 
		DD		0xffffffff		; 
		DB		"HELLO-OS   "	; 磁盘名称
		DB		"FAT12   "		; 磁盘格式名称
		RESB	18				; 
; 程序主体
		DB		0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
		DB		0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
		DB		0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
		DB		0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
		DB		0xee, 0xf4, 0xeb, 0xfd

; 信息显示部分
		DB		0x0a, 0x0a		; 
		DB		"hello, world"
		DB		0x0a			; 
		DB		0

		RESB	0x1fe-$			; $代表前面已经输入的字节数（类似一个变量），通过变量可以灵活控制字节数（不同内容前面占用的字节数可能不同）
		                        ; 程序再启动时，计算机会检查该软盘的第一个扇区（启动区）的最后两个字节
								; 若为 “0x55, 0xaa” 则认为该扇区为启动程序，开始执行，否则会报无法启动
		DB		0x55, 0xaa
; 以下是启动区以外部分的输出
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432