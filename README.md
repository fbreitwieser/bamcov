
Quick visualization of sequence coverage and alignment. This tool is based on [htslib](https://github.com/samtools/htslib) and may be integrated in [samtools](https://github.com/samtools/samtools) ([PR #992](https://github.com/samtools/samtools/pull/992)).

This repo is for testing new code prior to submitting it to samtools.

## Installation
```
git clone https://github.com/fbreitwieser/bamcov
make
```

## Usage
Show tabular output (default) with header:
```
./bamcov -H test.sam
```
![screenshot 2018-12-13 17 17 06](https://user-images.githubusercontent.com/516060/49970976-fc1f7800-fefa-11e8-9ce3-862ab0ae69ad.png)

Show histogram output:
```
./bamcov -m test.sam
```
![screenshot 2018-12-13 17 18 48](https://user-images.githubusercontent.com/516060/49971052-2c671680-fefb-11e8-99de-f0758213adac.png)


Author: Florian P Breitwieser, based on code of `samtools depth` by Heng Li and samtools contributors.
