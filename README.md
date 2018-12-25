# x86intrin [![Build Status](https://secure.travis-ci.org/kubo39/x86intrin.svg?branch=master)](http://travis-ci.org/kubo39/x86intrin)

x86 intrinsics for LDC

## Build

```console
$ DFLAGS="-mcpu=native" dub build --compiler=ldc2
```

## Test

Unfortunately, LDC compiler cannot run unittest block with `-mattr=+sse`

```console
$ DFLAGS="-mcpu=native" DC=ldmd2 make test
```
