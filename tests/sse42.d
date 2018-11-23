import x86intrin;

void test_crc32()
{
    assert(_mm_crc32_u32(1, 50000) == 971731851);
    assert(_mm_crc32_u64(0x000011115555AAAA, 0x88889999EEEE3333) == 0x0000000016F57621);
}

void main()
{
    test_crc32();
}
