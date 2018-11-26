module x86intrin.sse;

version(LDC)
{
    static assert (__traits(targetHasFeature, "sse"));
}

import core.simd;
version(LDC)
{
    import ldc.intrinsics;
    import ldc.simd;
}

version(LDC)
{
    pragma(LDC_intrinsic, "llvm.x86.sse.sfence")
        void _mm_sfence() pure @safe;
}
