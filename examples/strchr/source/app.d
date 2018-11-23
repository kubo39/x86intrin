import x86intrin;

ubyte* strchrSSE42(ubyte* p, int c)
{
    int[4] im = [c & 0xff, c & 0xff, c & 0xff, c & 0xff];
    while (_mm_cmpistra(loadUnaligned!(byte16)(cast(byte*)im.ptr),
                        loadUnaligned!(byte16)(cast(byte*)p),
                        cast(byte) 0x0))
    {
        p += 16;
    }
    if (_mm_cmpistrc(loadUnaligned!(byte16)(cast(byte*)im.ptr),
                     loadUnaligned!(byte16)(cast(byte*)p),
                     cast(byte) 0x0))
    {
        return p + _mm_cmpistri(loadUnaligned!(byte16)(cast(byte*)im.ptr),
                                loadUnaligned!(byte16)(cast(byte*)p),
                                cast(byte) 0x0);
    }
    return null;
}

void main()
{
    auto large = cast(ubyte*) "abcdefghijklmnopqrstuvwxyz\0".ptr;
    assert(((strchrSSE42(large, 'z')) - large) == 25);
    auto small = cast(ubyte*) "hoge\0".ptr;
    assert(strchrSSE42(small, 'A') is null);
}
