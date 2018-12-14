
Quick visualization of sequence coverage and alignment. This tool is based on [htslib](https://github.com/samtools/htslib) and may be integrated in [samtools](https://github.com/samtools/samtools) ([PR #992](https://github.com/samtools/samtools/pull/992)). This repo is for testing new code prior to submitting it to samtools.

## Installation
Prerequisites:
 - htslib (see FAQ below for installation instructions)
```
git clone https://github.com/fbreitwieser/bamcov
cd bamcov
make
```

## Usage
Show tabular output (default) with header:
```
./bamcov -H test.bam
```
![screenshot 2018-12-13 17 17 06](https://user-images.githubusercontent.com/516060/49970976-fc1f7800-fefa-11e8-9ce3-862ab0ae69ad.png)

Show histogram output:
```
./bamcov -m test.bam
```
![screenshot 2018-12-13 17 18 48](https://user-images.githubusercontent.com/516060/49971052-2c671680-fefb-11e8-99de-f0758213adac.png)

Show specific region (requires BAM index):
```
./bamcov -r chr1:100-1000 test.bam
```

Author: Florian P Breitwieser, based on code of `samtools depth` by Heng Li and samtools contributors.

## FAQ
#### Getting errors `'bamcov.c:(.text+0x47e): undefined reference to 'hts_itr_next'`, etc'
The linker does not see the hts library, see installing htslib. 

#### Installing htslib
For full instructions on installing htslib, see htslib's [INSTALL](https://github.com/samtools/htslib/blob/develop/INSTALL).
````
git clone https://github.com/samtools/htslib
cd htslib
./configure
make
sudo make install
```
