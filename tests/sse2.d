import x86intrin;

void test_maskmoveu()
{
    byte16 a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    byte16 b = [~0, ~0, ~0, ~0, 0, 0, 0, 0, ~0, ~0, ~0, ~0, 0, 0, 0, 0];
    ubyte[16] c;
    _mm_maskmoveu_si128(a, b, c.ptr);
    assert(c == [1, 2, 3, 4, 0, 0, 0, 0, 9, 10, 11, 12, 0, 0, 0, 0]);

}

void test_sad()
{
    byte16 x8 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    byte16 y8 = [5, 5, 5, 5, 5, 5, 5, 5, 5,  5,  5,  5,  5,  5,  5,  5];

    assert(_mm_sad_epu8(x8, y8) == [16, 60]);
}

void test_pack()
{
    short8 x16 = [1, 2, 3, 4, 5, 6, 0x1000, 0x2000];
    short8 y16 = [9, 10, 11, 12, 13, 14, 0x1000, 0x2000];

    int4 x32 = [1, 2, 3, 0x100_000];
    int4 y32 = [5, 6, 7, 0x100_000];

    assert(_mm_packs_epi16(x16, y16) == [1, 2, 3, 4, 5, 6, 0x7F, 0x7F, 9, 10, 11, 12, 13, 14, 0x7F, 0x7F]);
    assert(_mm_packs_epi32(x32, y32) == [1, 2, 3, 0x7FFF, 5, 6, 7, 0x7FFF]);
    assert(cast(ubyte16) _mm_packus_epi16(x16, y16) == [1, 2, 3, 4, 5, 6, 0xFF, 0xFF, 9, 10, 11, 12, 13, 14, 0xFF, 0xFF]);
}

void test_cmp_int()
{
    byte16 x8 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    byte16 y8 = [1, 3, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    short8 x16 = [1, 2, 3, 4, 5, 6, 7, 8];
    short8 y16 = [1, 3, 1, 4, 5, 6, 7, 8];
    int4 x32 = [1, 2, 3, 4];
    int4 y32 = [1, 3, 1, 4];

    assert(_mm_cmpeq_epi8(x8, y8) == [~0, 0, 0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0]);
    assert(_mm_cmpgt_epi8(x8, y8) == [0, 0, ~0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    assert(_mm_cmpeq_epi16(x16, y16) == [~0, 0, 0, ~0, ~0, ~0, ~0, ~0]);
    assert(_mm_cmpgt_epi16(x16, y16) == [0, 0, ~0, 0, 0, 0, 0, 0]);
    assert(_mm_cmpeq_epi32(x32, y32) == [~0, 0, 0, ~0]);
    assert(_mm_cmpgt_epi32(x32, y32) == [0, 0, ~0, 0]);
}

// void test_mm_set_int()
// {
//     byte16 zeros = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
//     assert(_mm_setzero_si128() == zeros);
// }

void test_extract()
{
    short8 x = [1, 2, 3, 4, 5, 6, 7, 8];
    assert(_mm_extract_epi16!(0)(x) == 1);
    assert(_mm_extract_epi16!(1)(x) == 2);
    assert(_mm_extract_epi16!(2)(x) == 3);
}

void main()
{
    test_maskmoveu();
    test_sad();
    test_pack();
    test_cmp_int();
    // test_mm_set_int();
    test_extract();
}
