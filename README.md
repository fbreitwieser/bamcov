
Quick visualization of sequence coverage and alignment. This tool is based on [htslib](https://github.com/samtools/htslib) and may be integrated in [samtools](https://github.com/samtools/samtools) ([PR #992](https://github.com/samtools/samtools/pull/992)).

This repo is for testing new code prior to submitting it to samtools.

## Installation
```
git clone https://github.com/fbreitwieser/bamcov
make
```

## Usage
```
# Show tabular output with header
./bamcov -H test.sam

# Show histogram output 
./bamcov -m test.sam
```

Author: Florian P Breitwieser
based on code of `samtools depth` by Heng Li and samtools contributors.
