import x86intrin;

void test_crc32()
{
    assert(_mm_crc32_u32(1, 50000) == 971731851);
    assert(_mm_crc32_u64(0x000011115555AAAA, 0x88889999EEEE3333) == 0x0000000016F57621);
}

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

void test_strlen()
{
    auto large = cast(const ubyte*) "abcdefghijklmnopqrstuvwxyz\0".ptr;
    assert(strlenSSE42(large) == 26);
    auto small = cast(const ubyte*) "hoge\0".ptr;
    assert(strlenSSE42(small) == 4);
}

void main()
{
    test_crc32();
    test_strlen();
}
