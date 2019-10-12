<?php
$exts = ['php'];            // 需要打包的文件后缀
$dir = __DIR__;             // 需要打包的目录
$file = 'jsc2js.phar';       // 包的名称, 注意它不仅仅是一个文件名, 在stub中也会作为入口前缀
$phar = new Phar(__DIR__ . '/release/' . $file, FilesystemIterator::CURRENT_AS_FILEINFO | FilesystemIterator::KEY_AS_FILENAME, $file);
// 开始打包
$phar->startBuffering();
// 将后缀名相关的文件打包
foreach ($exts as $ext) {
    $phar->buildFromDirectory($dir, '/\.' . $ext . '$/');
}
// 把build.php本身摘除
$phar->delete('build-jsc-byte.php');
$phar->delete('build-jsc2js.php');
// 设置入口
$phar->setStub($phar->createDefaultStub('jsc2js.php'));
$phar->stopBuffering();
// 打包完成
echo "Finished {$file}\n";