/* ����C���Ա���������һ�������ڱ���ļ���*/

void io_hlt(void);

/* �Ǻ���������������{}������; ��Ϊ������ʵ���ڱ���ļ�����Լ���һ�°�*/

void HariMain(void)
{

fin:
	io_hlt(); /* ִ�� naskfunc.nas��� _io_hlt  */
	goto fin;

}
