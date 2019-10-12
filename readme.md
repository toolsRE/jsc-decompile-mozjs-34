# `jsc-decompile-mozjs-34`

## Environment / 环境

### *NIX 

```sh
# install php 7+
sudo apt install php -y

## install composer / 安装 composer
## not necessary / 不需要, 已经提交了依赖
# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# php composer-setup.php
# php -r "unlink('composer-setup.php');"

```
### Windows

[**Official / 官网**](https://windows.php.net/download)

## Usage / 用法

```sh
# clone / 克隆
git clone --depth 1 https://github.com/toolsRE/jsc-decompile-mozjs-34


# jsc to js / 将 jsc 转换为 js
php jsc2js.php /path/to/in.jsc > /path/to/out.jsc.txt
# or / 或者
php run.php /path/to/in.jsc > /path/to/out.jsc.txt
# Or use the phar / 或者直接使用编译好的 phar
php release/jsc2js.phar /path/to/in.jsc > /path/to/out.jsc.txt

# if this didn't work, you can also try below command to get the bytecode / 如果 jsc to js 不起作用, 可以尝试用以下命令将 jsc 转换为 bytecode

# jsc to bytecode
php jsc-byte.php /path/to/in.jsc > /path/to/out.jsc.txt
# or / 或者
php scan.php /path/to/in.jsc > /path/to/out.jsc.txt
# Or use the phar / 或者直接使用编译好的 phar
php release/jsc-byte.phar /path/to/in.jsc > /path/to/out.jsc.txt

```



---

# Original README

#1.Summary

This project is a javascript bytecode decoder for mozilla spider-monkey version 34.

This version may decompile jsc file compile by cocos-2dx.

It would not work for different version of Mozilla spider-monkey (without shell of course), for its opcode defined different for each version.

#2.Usage

##2.1.Install PHP and Composer

If you are familiar with php, you can skip this part.

install php7.0
```
# ubuntu
$ sudo apt install php7.0

# mac
$ brew install php7.0

# windows
# just google an binary one
```
install composer
>see https://getcomposer.org/download/

install this project
```
$ cd path/to/project
$ composer install
```

##2.2.decompile *.jsc file

```
$ cd path/to/project
$ php run.php *.jsc > path/to/decompile.txt
#if this didn't work, you can also try below command to get the bitcode
$ php scan.php > path/to/scan.txt
```

#3.Besides

This project is not complete yet.

- A Fatal Bug was found when decompile with a deep context

Decompile result is not a runable file.
Some local variables are auto generate, for the compiler discards local variables.
