
CC=gcc
CFLAGS=-Wall -lm -lhts -std=c99 $(LDFLAGS) $(CPPFLAGS) -I/usr/local/include -L/usr/local/lib

ifneq ($(HTSLIB),)
	CFLAGS+=-I$(HTSLIB)/include -L$(HTSLIB)/lib
endif

all: bamcov

clean:
	rm -v bamcov

html-header.hpp: bamcov.html
	xxd -i $^ > $@

bamcov: bamcov.c
	$(CC) $(CCFLAGS) -o $@ $^ $(CFLAGS)

test: bamcov
	./bamcov -H test.sam | column -ts$$'\t'
	./bamcov -m test.sam

bamcov.tar.gz: bamcov.c bamcov REPORT README task_CPP_prog.bam
	tar zcvf $@ $^
