# qmc-tool

解密Q*音乐加密的音频文件

A program to decrypt .qmcflac, .qmcogg, etc. file.

## usage

```
qmc-tool $IN_FILE $OUT_FILE
```

## how to build

需要安装nasm来编译汇编代码

You need nasm for compiling assembly file.

## where's qmc file?

On macOS, qmc file is located in folders:

~/Library/Containers/com.tencent.QQMusicMac/Data/Library/Application Support/QQMusicMac/iMusic

~/Library/Containers/com.tencent.QQMusicMac/Data/Library/Application Support/QQMusicMac/iQmc

(I don't have a Windows PC so I don't now the location on Windows)

## how to get qmc file?

The app will do automatic caching if you listen to some of the songs often. You can also download songs by yourself.

Files with extension '.qmcflac', '.qmcogg' is encrypted, other extension such as '.flac', '.ogg' is not encrypted.
