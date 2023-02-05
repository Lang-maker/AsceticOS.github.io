/* 告诉C语言编译器，有一个函数在别的文件里*/

void io_hlt(void);

/* 是函数声明，但不用{}，而用; 意为函数的实现在别的文件里，你自己找一下吧*/

void HariMain(void)
{

fin:
	io_hlt(); /* 执行 naskfunc.nas里的 _io_hlt  */
	goto fin;

}
