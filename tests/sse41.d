import x86intrin;

void test_mm_testc_si128()
{
    int4 x = [0x7, 0x7, 0x7, 0x7];
    int4 y = [0x3, 0x3, 0x3, 0x3];
    int4 z = [0x8, 0x8, 0x8, 0x8];

    assert(_mm_testc_si128(x, y) == 1);
    assert(_mm_testc_si128(x, z) == 0);
}

void test_mm_testnzc_si128()
{
    {
        int4 a = [0, 0, 0, 0];
        int4 b = [~0, ~0, 0, 0];
        assert(_mm_testnzc_si128(a, b) == 0);
    }
    {
        int4 a = [1, 0, 0, 0];
        int4 b = [~0, ~0, 0, 0];
        assert(_mm_testnzc_si128(a, b) == 1);
    }
}

void test_mm_testz_si128()
{
    long2 x = [0, 0];
    long2 y = [(1L << 32) + 1, (1L << 32) + 1];
    long2 z = [(2L << 32) + 2, (2L << 32) + 2];

    assert(_mm_testz_si128(x, x) == 1);
    assert(_mm_testz_si128(y, y) == 0);
    assert(_mm_testz_si128(z, z) == 0);
    assert(_mm_testz_si128(y, z) == 1);
}

void main()
{
    test_mm_testc_si128();
    test_mm_testnzc_si128();
    test_mm_testz_si128();
}
