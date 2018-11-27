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

immutable uint MM_EXCEPT_MASK = 0x003f;
immutable uint MM_MASK_MASK = 0x1f80;
immutable uint MM_ROUND_MASK = 0x6000;
immutable uint MM_FLUSH_ZERO_MASK = 0x8000;

version(LDC)
{
    pragma(LDC_intrinsic, "llvm.x86.sse.stmxcsr")
        void _mm_stmxcsr(const byte*) pure @safe;
    pragma(LDC_intrinsic, "llvm.x86.sse.ldmxcsr")
        void _mm_ldmxcsr(const byte*) pure @safe;

    pragma(LDC_intrinsic, "llvm.x86.sse.sfence")
        void _mm_sfence() pure @safe;

    // uint _mm_getcsr() pure
    // {
    //     uint x = void;
    //     llvm_stmxcsr(cast(const byte*) &x);
    //     return x;
    // }

    // uint _mm_get_exception_mask() pure
    // {
    //     return _mm_getcsr() & MM_MASK_MASK;
    // }

    // uint _mm_get_excpetion_state() pure
    // {
    //     return _mm_getcsr() & MM_EXCEPT_MASK;
    // }

    // uint _mm_get_flush_zero_mode() pure
    // {
    //     return _mm_getcsr() & MM_FLUSH_ZERO_MASK;
    // }

    // uint _mm_get_rounding_mode() pure
    // {
    //     return _mm_getcsr() & MM_ROUND_MASK;
    // }

    // void _mm_setcsr(uint a) pure
    // {
    //     llvm_ldmxcsr(cast(const byte*) a);
    // }
}
