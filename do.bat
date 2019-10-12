
@echo off 
:: & color 0A
::指定起始文件夹
set DIR="%1"
if not exist %DIR% (
    echo "%DIR% not exist"
    Goto :eof
)
echo DIR=%DIR%
 
:: 参数 /R 表示需要遍历子文件夹,去掉表示不遍历子文件夹
:: %%f 是一个变量,类似于迭代器,但是这个变量只能由一个字母组成,前面带上%%
:: 括号中是通配符,可以指定后缀名,*.*表示所有文件
for /R %DIR% %%f in (*.jsc) do ( 
    echo %%f
    php release/jsc2js.phar %%f > %%f.jsc2js.txt
    php release/jsc-byte.phar %%f > %%f.jsc-byte.txt
)
