import x86intrin;

size_t strlenSSE42(const ubyte* top)
{
    int4 im = [0xff01, 0xff01, 0xff01, 0xff01];
    ubyte* p = cast(ubyte*) top;
    while (!_mm_cmpistrz(cast(byte16)im, loadUnaligned!(byte16)(cast(const byte*)p), cast(byte) 0x14))
    {
        p += 16;
    }
    p += _mm_cmpistri(cast(byte16)im, loadUnaligned!(byte16)(cast(const byte*)p), cast(byte) 0x14);
    return p - top;
}

void main()
{
    auto large = cast(const ubyte*) "abcdefghijklmnopqrstuvwxyz\0".ptr;
    assert(strlenSSE42(large) == 26);
    auto small = cast(const ubyte*) "hoge\0".ptr;
    assert(strlenSSE42(small) == 4);
}
