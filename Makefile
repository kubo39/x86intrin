.PHONY: clean

DC := ldmd2

LINKFLAGS = \
	 -I./source

SRCS = \
	$(shell find source/x86intrin -name "*.d")

OUTDIR = out

LFLAGS = -od=$(OUTDIR)

SSE2_TEST_SRC = tests/sse2.d
SSE3_TEST_SRC = tests/sse3.d
SSE41_TEST_SRC = tests/sse41.d
SSE42_TEST_SRC = tests/sse42.d

test: test_sse2 test_sse3 test_sse41 test_sse42

test_sse2: $(SSE2_TEST_SRC)
	$(DFLAGS) $(DC) -op $(LINKFLAGS) $^ -of$(OUTDIR)/$(@F).bin
	$(OUTDIR)/$(@F).bin

test_sse3: $(SSE3_TEST_SRC)
	$(DFLAGS) $(DC) -op $(LINKFLAGS) $^ -of$(OUTDIR)/$(@F).bin
	$(OUTDIR)/$(@F).bin

test_sse41: $(SSE41_TEST_SRC)
	$(DFLAGS) $(DC) -op $(LINKFLAGS) $^ -of$(OUTDIR)/$(@F).bin
	$(OUTDIR)/$(@F).bin

test_sse42: $(SSE42_TEST_SRC)
	$(DFLAGS) $(DC) -op $(LINKFLAGS) $^ -of$(OUTDIR)/$(@F).bin
	$(OUTDIR)/$(@F).bin

clean:
	$(RM) $(OUTDIR)/*
