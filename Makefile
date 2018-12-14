
CC=gcc
CFLAGS=-Wall -lm -std=c99 -Lhtslib
INCLUDE=-Ihtslib

all: bamcov

clean:
	rm -v bamcov

html-header.hpp: bamcov.html
	xxd -i $^ > $@

bamcov: bamcov.c libhts.so
	$(CC) $(CCFLAGS) $(INCLUDE) -o $@ $^ $(LDFLAGS) $(CFLAGS) $(CPPFLAGS) -lhts

test: bamcov
	./bamcov -H test.sam | column -ts$$'\t'
	./bamcov -m test.sam

libhts.so:
	cd htslib && make libhts.so && cp libhts.so* .. && cd ..

bamcov.tar.gz: bamcov.c bamcov REPORT README task_CPP_prog.bam
	tar zcvf $@ $^
