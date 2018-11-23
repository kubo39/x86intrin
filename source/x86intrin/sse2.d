module x86intrin.sse2;

version(LDC):

static assert (__traits(targetHasFeature, "sse2"));

import core.simd;
import ldc.intrinsics;
import ldc.simd;

pragma(LDC_intrinsic, "llvm.x86.sse2.pmadd.wd")
int4 _mm_madd_epi16(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.packsswb.128")
byte16 _mm_packs_epi16(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.packssdw.128")
short8 _mm_packs_epi32(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.packuswb.128")
byte16 _mm_packus_epi16(short8, short8) pure @safe;


pragma(LDC_intrinsic, "llvm.x86.sse2.pmovmskb.128")
int _mm_pmovmskb_128(byte16) pure @safe;


pragma(LDC_intrinsic, "llvm.x86.sse2.psad.bw")
long2 _mm_sad_epu8(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psll.w")
short8 _mm_sll_epi16(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psll.d")
int4 _mm_sll_epi32(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psll.q")
long _mm_sll_epi64(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.pslli.w")
short8 _mm_slli_epi16(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.pslli.d")
int4 _mm_slli_epi32(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.pslli.q")
long2 _mm_slli_epi64(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psra.w")
short8 _mm_sra_epi16(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psra.d")
int4 _mm_sra_epi32(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrai.w")
short _mm_srai_epi16(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrai.d")
int4 _mm_srai_epi32(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrl.w")
short8 _mm_srl_epi16(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrl.d")
int4 _mm_srl_epi32(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrl.q")
long2 _mm_srl_epi64(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrli.w")
short8 _mm_srli_epi16(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrli.d")
int4 _mm_srli_epi32(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.psrli.q")
long2 _mm_srli_epi64(long2, int) pure @safe;


pragma(LDC_intrinsic, "llvm.x86.sse2.maskmov.dqu")
void _mm_maskmoveu_si128(byte16, byte16, ubyte*) pure @safe;


pragma(LDC_intrinsic, "llvm.x86.sse2.clflush")
void _mm_clflush(const ubyte*) pure @safe;


pragma(LDC_intrinsic, "llvm.x86.sse2.lfence")
void _mm_lfence() pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.mfence")
void _mm_mfence() pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse2.pause")
void _mm_pause() pure @safe;


byte16 _mm_set1_epi8(byte a) pure
{
    byte[16] result = [a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a];
    return loadUnaligned!(byte16)(result.ptr);
}

byte16 _mm_setr_epi8(byte e15, byte e14, byte e13, byte e12,
                     byte e11, byte e10, byte e9, byte e8,
                     byte e7, byte e6, byte e5, byte e4,
                     byte e3, byte e2, byte e1, byte e0) pure
{
    byte[16] result = [e15, e14, e13, e12, e11, e10, e9, e8,
                       e7, e6, e5, e4, e3, e2, e1, e0];
    return loadUnaligned!(byte16)(result.ptr);
}

int4 _mm_setr_epi32(int i0, int i1, int i2, int i3) pure
{
    int[4] result = [i0, i1, i2, i3];
    return loadUnaligned!(int4)(result.ptr);
}

int4 _mm_add_epi32(int4 a, int4 b) pure
{
    return a + b;
}

byte16 _mm_and_si128(byte16 a, byte16 b) pure
{
    return a & b;
}

byte16 _mm_andnot_si128(byte16 a, byte16 b) pure
{
    return (~a) & b;
}

byte16 _mm_or_si128(byte16 a, byte16 b) pure
{
    return a | b;
}

byte16 _mm_setzero_si128() pure
{
    int[4] result = [0, 0, 0, 0];
    return cast(byte16)( loadUnaligned!(int4)(result.ptr) );
}

byte16 _mm_cmpgt_epi8(byte16 a, byte16 b) pure
{
    return greaterMask!(byte16)(a, b);
}

byte16 _mm_cmpeq_epi8(byte16 a, byte16 b) pure
{
    return equalMask!(byte16)(a, b);
}
