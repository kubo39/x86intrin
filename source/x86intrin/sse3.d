module x86intrin.sse3;

version(LDC)
{
    static assert (__traits(targetHasFeature, "sse3"));
}

nothrow:
@nogc:

import core.simd;
version(LDC)
{
    import ldc.intrinsics;
    import ldc.simd;
}

version(LDC)
{
    pragma(LDC_intrinsic, "llvm.x86.sse3.ldu.dq")
        byte16 _mm_lddqu_si128(const ubyte* p) pure @safe;
}
