
CC=gcc
CFLAGS=-std=c99 -Wall -lm -lz -llzma -lbz2
INCLUDE=-Ihtslib -Lhtslib

## From htslib Makefile: specify shlib flavor based on platform
# $(shell), :=, and ifeq/.../endif are GNU Make-specific.  If you don't have
# GNU Make, comment out the parts of these conditionals that don't apply.
ifneq "$(origin PLATFORM)" "file"
PLATFORM := $(shell uname -s)
endif
ifeq "$(PLATFORM)" "Darwin"
HTSLIB=libhts.dylib
else ifeq "$(findstring CYGWIN,$(PLATFORM))" "CYGWIN"
HTSLIB=cyghts-$(LIBHTS_SOVERSION).dll
else ifeq "$(findstring MSYS,$(PLATFORM))" "MSYS"
HTSLIB=hts-$(LIBHTS_SOVERSION).dll
else
HTSLIB=libhts.so
endif

all: bamcov bamcov-static

clean:
	rm -v bamcov

html-header.hpp: bamcov.html
	xxd -i $^ > $@

bamcov: bamcov.c htslib/$(HTSLIB)
	$(CC) $(CCFLAGS) $(INCLUDE) -o $@ bamcov.c $(CFLAGS) -lhts

bamcov-static: bamcov.c htslib/libhts.a
	gcc -Ihtslib -o $@ $^ $(CFLAGS)

test: bamcov
	./bamcov -H test.sam | column -ts$$'\t'
	./bamcov -m test.sam

htslib:
	git clone https://github.com/samtools/htslib

htslib/$(HTSLIB): htslib
	cd htslib && make $(HTSLIB)

bamcov.tar.gz: bamcov bamcov.c README.md Makefile test.bam test.bam.bai
	tar zcvf $@ $^
