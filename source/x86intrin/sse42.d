module x86intrin.sse42;

version(LDC)
{
    static assert (__traits(targetHasFeature, "sse4.2"));
}

nothrow:
@nogc:

import core.simd;
version(LDC)
{
    import ldc.intrinsics;
    import ldc.simd;
}

immutable int SIDD_UBYTE_OPS = 0x00;
immutable int SIDD_UWORD_OPS = 0x01;
immutable int SIDD_SBYTE_OPS = 0x02;
immutable int SIDD_SWORD_OPS = 0x03;

immutable int SIDD_CMP_EQUAL_ANY = 0x00;
immutable int SIDD_CMP_RANGES = 0x04;
immutable int SIDD_CMP_EQUAL_EACH = 0x08;
immutable int SIDD_CMP_EQUAL_ORDERED = 0x0c;

immutable int SIDD_POSITIVE_POLARITY = 0x00;
immutable int SIDD_NEGATIVE_POLARITY = 0x10;
immutable int SIDD_MASKED_POSITIVE_POLARITY = 0x20;
immutable int SIDD_MASKED_NEGATIVE_POLARITY = 0x30;

immutable int SIDD_LEAST_SIGNIFICANT = 0x00;
immutable int SIDD_MOST_SIGNIFICANT = 0x40;

immutable byte SIDD_BIT_MASK = 0x00;
immutable byte SIDD_UNIT_MASK = 0x40;


version(LDC)
{
// pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestrm128")
// byte16 _mm_cmpestrm(byte16, int, byte16, int, ubyte) pure @safe;

// pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestri128")
// int _mm_cmpestri(byte16, int, byte16, int, ubyte) pure @safe;

// pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestria128")
// int _mm_cmpestra(byte16, int, byte16, int, ubyte) pure @safe;

// pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestric128")
// int _mm_cmpestrc(byte16, int, byte16, int, ubyte) pure @safe;

// pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestrio128")
// int _mm_cmpestro(byte16, int, byte16, int, ubyte) pure @safe;

// pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestris128")
// int _mm_cmpestrs(byte16, int, byte16, int, ubyte) pure @safe;

// pragma(LDC_intrinsic, "llvm.x86.sse42.pcmpestriz128")
// int _mm_cmpestrz(byte16, int, byte16, int, ubyte) pure @safe;


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

// pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.32.8")
// ubyte _mm_crc32_u8(ubyte, ubyte) pure @safe;

// pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.32.16")
// ushort _mm_crc32_u16(ushort, ushort) pure @safe;

    pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.32.32")
        uint _mm_crc32_u32(uint, uint) pure @safe;

    pragma(LDC_intrinsic, "llvm.x86.sse42.crc32.64.64")
        ulong _mm_crc32_u64(ulong, ulong) pure @safe;
}
