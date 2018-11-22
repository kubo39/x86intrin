import core.simd;
import x86intrin.sse3;

void test_lddqu()
{
    int4 x = [1, 2, 3, 4];
    auto p = x.ptr;
    auto r = _mm_lddqu_si128(cast(const ubyte*)p);
    assert(cast(int4) r == [1, 2, 3, 4]);
}

void main()
{
    test_lddqu();
}
