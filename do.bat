
@echo off 
:: & color 0A
::ָ����ʼ�ļ���
set DIR="%1"
if not exist %DIR% (
    echo "%DIR% not exist"
    Goto :eof
)
echo DIR=%DIR%
 
:: ���� /R ��ʾ��Ҫ�������ļ���,ȥ����ʾ���������ļ���
:: %%f ��һ������,�����ڵ�����,�����������ֻ����һ����ĸ���,ǰ�����%%
:: ��������ͨ���,����ָ����׺��,*.*��ʾ�����ļ�
for /R %DIR% %%f in (*.jsc) do ( 
    echo %%f
    php release/jsc2js.phar %%f > %%f.jsc2js.txt
    php release/jsc-byte.phar %%f > %%f.jsc-byte.txt
)
