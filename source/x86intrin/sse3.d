module x86intrin.sse3;

version(LDC):

static assert (__traits(targetHasFeature, "sse3"));

nothrow:
@nogc:

import core.simd;
import ldc.intrinsics;
import ldc.simd;

pragma(LDC_intrinsic, "llvm.x86.sse3.ldu.dq")
byte16 _mm_lddqu_si128(const ubyte* p) pure @safe;


unittest
{
    // lddqu
    {
        int4 x = [1, 2, 3, 4];
        auto p = x.ptr;
        auto r = _mm_lddqu_si128(p);
        assert(cast(int4) r == [1, 2, 3, 1]);
    }
}
