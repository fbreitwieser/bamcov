
```  
┌┐ ┌─┐┌┬┐┌─┐┌─┐┬  ┬              Quick calculation and visualization
├┴┐├─┤││││  │ │└┐┌┘             of sequence coverage on the terminal
└─┘┴ ┴┴ ┴└─┘└─┘ └┘ v0.1      
```
This tool is based on [htslib](https://github.com/samtools/htslib) and may be integrated in [samtools](https://github.com/samtools/samtools) ([PR #992](https://github.com/samtools/samtools/pull/992)). This standalone version will implement new features and will be maintained on its own.

## Installation
Make sure to clone the repository with `--recurse-submodules` to get the htslib, otherwise it is necessary to type `git submodule update --init --recursive` in the cloned repository.
```
git clone --recurse-submodules https://github.com/fbreitwieser/bamcov
cd bamcov
make
make test
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
./bamcov -mr NW_002477246.1:1000-200000 test.bam
```
![screenshot 2018-12-14 15 39 19](https://user-images.githubusercontent.com/516060/50026309-782ac600-ffb6-11e8-9676-258c5b0517db.png)

Use full window width for histogram:
```
./bamcov -w0 -mr NW_002477246.1:100 test.bam
```

For high-res mode with 80 steps on the histogram y-axis instead of 20, use the flags `-mU`. To see if your terminal/font support it check with `./bamcov -v`.

Author: Florian P Breitwieser, based on code of `samtools depth` by Heng Li and samtools contributors.

