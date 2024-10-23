global isListening := false

1::
{
    global isListening
    isListening := true

    While isListening
    {
        doubleRetryTime := Random(1000, 2000)
        SendKey("q")
        Sleep doubleRetryTime
    }
}

2::
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