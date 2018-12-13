
CXX=gcc
EXTRA_FLAGS=

all: bamcov

clean:
	rm -v bamcov

html-header.hpp: bamcov.html
	xxd -i $^ > $@

bamcov: bamcov.c
	$(CXX) $(EXTRA_FLAGS) -lhts -o $@ $^

test: bamcov
	./bamcov -H test.sam | column -ts$$'\t'
	./bamcov -m test.sam

bamcov.tar.gz: bamcov.c bamcov REPORT README task_CPP_prog.bam
	tar zcvf $@ $^
