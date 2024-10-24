# 第一后裔 AutoHotKey脚本

## 项目须知

* 本项目仅供学习使用
* 请在下载后24小时内删除
* 禁止做出危害其他互联网产品的行为
* 一切因使用本项目脚本造成的后果，均由使用者自身负责
* 若本项目侵犯了有关方面的权益，我会在第一时间删除本项目


## 前言

众所周知，Nexon的游戏脚本蔚然成风。



我在小时候就没机会做冒险岛吸怪+不动如山+只跳1的人，现在到了TFD，有能力了，得学会解放双手了。


本项目使用AutoHotKey 2.0语法编写，在使用过程中可以自行编译，或者使用发布版本的exe程序。这里推荐自行编译，因为可以根据个人需求修改时间与快捷键。


## 功能列表

| 名称  | 功用        |
| :---- | :---------- |
| space | 兔子跳      |
| q     | q技能蹭输出 |


## 实现细节

由于直接发送命令的方式，在TFD中无法实现。因此采用了调用系统dll的方式来进行键盘的操作。


为了防止有重复操作的检测，所有的间隔都做了随机数处理，尽量模拟了人的操作。


## 自行编译方法

### 环境准备

1. 前往AutoHotKey官网：<https://www.autohotkey.com/>
2. 点击"Download" -> "Download v2.0"
3. 安装应用
4. 启动后，点击"Compile"，首次使用会下载编译器

### 编译

1. 点击"Compile"打开的窗口，第一行后的Browse中，浏览到你想要编译的脚本
2. 默认会将exe文件生成为相同目录下的同名文件，也可以在第二行上指定文件名

### 常用快捷键

|符号|键位|
|:--|:--|
|^|Ctrl|
|!|Alt|
|+|Shift|
|#|Windows|

如果想改成自己的键位可以自行修改后编译使用。

## 常用语法解析

授人以鱼不如授人以渔，以最早版本兔子跳为例，介绍脚本常用的语法

```ahk
global isListening := false
; global声明的全局变量，用于控制循环的开关

; 组合快捷键，结合上面的表格，就是Ctrl+Alt+F1
; 两个冒号代表按键之后，然后紧跟着大括号扩起来的，是要执行的逻辑
^!F1::
{
    global isListening

    ; 冒号等于，用于变量的赋值。这里是给全局变量isListing赋值为真，以打开循环
    isListening := true

    ; 执行封装的方法，DoLoop
    DoLoop()
}

; 这个目的是，如果按了trl+Alt+F2的组合键，就可以中断循环
^!F2::
{
    global isListening

    if (isListening)
    {
        isListening := false
    }
}

; 封装好的，执行循环逻辑的方法
DoLoop()
{
    global isListening

    ; 循环条件，isListening为真时，一直执行
    While isListening
    {
        ; 输入空格键
        SendKey("Space") 
        ; 等待0.45 ~ 0.5秒
        doubleJumpTime:= Random(450, 500)
        Sleep doubleJumpTime
        SendKey("Space")

        jumpWaitTime:= Random(1900, 2200)
        Sleep jumpWaitTime
    }
}

; 调用系统Dll，发送按下键盘的信号
SendKey(Key)
{
    VK := GetKeyVK(Key), SC := GetKeySC(Key)
    DllCall("keybd_event", "UChar", VK, "UChar", SC, "UInt", 0, "UPtr", 0)
    clickTime := Random(15, 20)
    Sleep(clickTime)
    DllCall("keybd_event", "UChar", VK, "UChar", SC, "UInt", 2, "UPtr", 0)
}
```
