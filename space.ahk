global isListening := false

^!F1::
{
    global isListening
    isListening := true

    While isListening
    {
        SendKey("Space") 
        doubleJumpTime:= Random(450, 500)
        Sleep doubleJumpTime
        SendKey("Space")

        jumpWaitTime:= Random(1900, 2200)
        Sleep jumpWaitTime
    }
}

^!F2::
{
    global isListening

    if (isListening)
    {
        isListening := false
    }
}

SendKey(Key)
{
    VK := GetKeyVK(Key), SC := GetKeySC(Key)
    DllCall("keybd_event", "UChar", VK, "UChar", SC, "UInt", 0, "UPtr", 0)
    clickTime := Random(15, 20)
    Sleep(clickTime)
    DllCall("keybd_event", "UChar", VK, "UChar", SC, "UInt", 2, "UPtr", 0)
}