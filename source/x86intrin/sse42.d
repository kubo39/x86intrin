module x86intrin.sse42;

version(LDC):

static assert (__traits(targetHasFeature, "sse4.2"));

nothrow:
@nogc:

import core.simd;
import ldc.intrinsics;
import ldc.simd;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestrm128")
byte16 _mm_cmpestrm(byte16, byte16, int, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestri128")
int _mm_cmpestri(byte16, byte16, int, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestria128")
int _mm_cmpestra(byte16, byte16, int, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestric128")
int _mm_cmpestrc(byte16, byte16, int, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestrio128")
int _mm_cmpestro(byte16, byte16, int, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestris128")
int _mm_cmpestrs(byte16, byte16, int, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestriz128")
int _mm_cmpestrz(byte16, byte16, int, ubyte) pure @safe;


pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpistrm128")
byte16 _mm_cmpistrm(byte16, byte16, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpistri128")
int _mm_cmpistri(byte16, byte16, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpistria128")
int _mm_cmpistra(byte16, byte16, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpistric128")
int _mm_cmpistrc(byte16, byte16, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpistrio128")
int _mm_cmpistro(byte16, byte16, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpistris128")
int _mm_cmpistrs(byte16, byte16, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpistriz128")
int _mm_cmpistrz(byte16, byte16, ubyte) pure @safe;


// TODO?
//   pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.32.#")
//   T _mm_crc32(T)(T a, b) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.32.8")
ubyte _mm_crc32_u8(ubyte, ubyte) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.32.16")
ushort _mm_crc32_u16(ushort, ushort) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.32.32")
uint _mm_crc32_u32(uint, uint) pure @safe;

pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.64.64")
ulong _mm_crc32_u64(ulong, ulong) pure @safe;


unittest
{
    // test crc
    {
        assert(_mm_crc32_u8(1, 100) == 1412925310);
        assert(_mm_crc32_u16(1, 1000) == 3870914500);
        assert(_mm_crc32_u32(1, 50000) == 971731851);
        assert(_mm_crc32_u64(0x000011115555AAAA, 0x88889999EEEE3333) == 0x0000000016F57621);
    }

    size_t strlenSSE42(const ubyte* top)
    {
        int4 im = [0xff01, 0xff01, 0xff01, 0xff01];
        ubyte* p = cast(ubyte*) top;
        while (!_mm_cmpistrz(cast(byte16)im, loadUnaligned!(byte16)(cast(const byte*)p), cast(byte) 0x14))
        {
            p += 16;
        }
        p += _mm_cmpistri(cast(byte16)im, loadUnaligned!(byte16)(cast(const byte*)p), cast(byte) 0x14);
        return p - top;
    }

    {
        auto large = cast(const ubyte*) "abcdefghijklmnopqrstuvwxyz\0".ptr;
        assert(strlenSSE42(large) == 26);
        auto small = cast(const ubyte*) "hoge\0".ptr;
        assert(strlenSSE42(small) == 4);
    }
}
