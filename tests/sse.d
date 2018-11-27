import x86intrin;

uint mm_getcsr()
{
    uint x = void;
    _mm_stmxcsr(cast(const byte*) &x);
    return x;
}

void test_mm_getcsr()
{
    mm_getcsr();
}

void main()
{
    test_mm_getcsr();
}
