module x86intrin;

nothrow:
@nogc:

public import core.simd;
version(LDC)
{
    public import ldc.simd;
}

version(LDC)
{
static if (__traits(targetHasFeature, "sse"))
    public import x86intrin.sse;
static if (__traits(targetHasFeature, "sse2"))
    public import x86intrin.sse2;
static if (__traits(targetHasFeature, "sse3"))
    public import x86intrin.sse3;
static if (__traits(targetHasFeature, "sse4.1"))
    public import x86intrin.sse41;
static if (__traits(targetHasFeature, "sse4.2"))
    public import x86intrin.sse42;
}
else
{
    public import x86intrin.sse;
    public import x86intrin.sse2;
    public import x86intrin.sse3;
    public import x86intrin.sse41;
    public import x86intrin.sse42;
}
