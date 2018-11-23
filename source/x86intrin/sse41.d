module x86intrin.sse41;

version(LDC):

static assert (__traits(targetHasFeature, "sse4.1"));

nothrow:
@nogc:

import core.simd;
import ldc.intrinsics;
import ldc.simd;

// pragma(LDC_intrinsic, "llvm.x86.sse41.pblendvb")
// pragma(LDC_intrinsic, "llvm.x86.sse41.blendvpd")
// pragma(LDC_intrinsic, "llvm.x86.sse41.blendvps")
// pragma(LDC_intrinsic, "llvm.x86.sse41.round.ss")
// pragma(LDC_intrinsic, "llvm.x86.sse41.round.ps")
// pragma(LDC_intrinsic, "llvm.x86.sse41.round.sd")
// pragma(LDC_intrinsic, "llvm.x86.sse41.round.pd")
// pragma(LDC_intrinsic, "llvm.x86.sse41.insertps")

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovsxbd")
int4 _mm_cvtepi8_epi32(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovsxbq")
long2 _mm_cvtepi8_epi64(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovsxbw")
byte16 _mm_cvtepi8_epi16(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovsxdq")
long2 _mm_cvtepi32_epi64(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovsxwd")
int4 _mm_cvtepi16_epi32(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovsxwq")
long2 _mm_cvtepi16_epi64(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovzxbd")
int4 _mm_cvtepu8_epi32(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovzxbq")
long2 _mm_cvtepu8_epi64(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovzxbw")
byte16 _mm_cvtepu8_epi16(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovzxdq")
long2 _mm_cvtepu32_epi64(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovzxwd")
int4 _mm_cvtepu16_epi32(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.pmovzxwq")
long2 _mm_cvtepu16_epi64(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.ptestc")
int _mm_testc_si128(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.ptestnzc")
int _mm_testnzc_si128(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse41.ptestz")
int _mm_testz_si128(long2, long2) pure @safe;
