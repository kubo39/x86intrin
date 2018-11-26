import x86intrin;

size_t strlenSSE42(const ubyte* top)
{
    ubyte16 im = [0x01, 0xff, 0x01, 0xff, 0x01, 0xff, 0x01, 0xff,
                  0x01, 0xff, 0x01, 0xff, 0x01, 0xff, 0x01, 0xff];
    ubyte* p = cast(ubyte*) top;
    while (!_mm_cmpistrz(im, loadUnaligned!(byte16)(cast(const byte*)p), 0x14))
    {
        p += 16;
    }
    p += _mm_cmpistri(im, loadUnaligned!(byte16)(cast(const byte*)p), 0x14);
    return p - top;
}

void main()
{
    auto large = cast(const ubyte*) "abcdefghijklmnopqrstuvwxyz\0".ptr;
    assert(strlenSSE42(large) == 26);
    auto small = cast(const ubyte*) "hoge\0".ptr;
    assert(strlenSSE42(small) == 4);
}
