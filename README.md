# qmc-tool

解密QQ音乐加密的音频文件

A program to decrypt qmc file. (.qmcflac, .qmcogg, .qmc0, etc.)

## usage

```
qmc-tool $IN_FILE $OUT_FILE
```

## where's qmc file?

On macOS, qmc file is located in folders:

~/Library/Containers/com.tencent.QQMusicMac/Data/Library/Application Support/QQMusicMac/iMusic

~/Library/Containers/com.tencent.QQMusicMac/Data/Library/Application Support/QQMusicMac/iQmc

(I don't have a Windows PC so I don't know the location on Windows)

## how to get qmc file?

The app will do automatic caching if you listen to some of the songs often. You can also download songs in the app by yourself.

Files with extension '.qmcflac', '.qmcogg' is encrypted, other extension such as '.flac', '.ogg' is not encrypted.
