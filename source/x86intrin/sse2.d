module x86intrin.sse2;

version(LDC):

import core.simd;
import ldc.simd;

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
