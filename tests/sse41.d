import core.simd;
import x86intrin;

void test_testz_si128()
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
    test_testz_si128();
}
