import x86intrin;

void test_sad()
{
    byte16 x8 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    byte16 y8 = [5, 5, 5, 5, 5, 5, 5, 5, 5,  5,  5,  5,  5,  5,  5,  5];

    assert(_mm_sad_epu8(x8, y8) == [16, 60]);
}

void main()
{
    test_sad();
}
