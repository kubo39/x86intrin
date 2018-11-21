module x86intrin;

version(LDC):

static if (__traits(targetHasFeature, "sse2"))
    import x86intrin.sse2;
static if (__traits(targetHasFeature, "sse4.1"))
    import x86intrin.sse41;
static if (__traits(targetHasFeature, "sse4.2"))
    import x86intrin.sse42;
