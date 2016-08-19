# build a tree of Kin11 clade and Kin6 clade

Tripsacum sequences as assembled from short read data, only largest two contigs included.

Required software:

- RAxML
- mrbayes

All parameters in MRBAYES block in nexus file.

```/Users/michelle/Downloads/standard-RAxML-master/raxmlHPC-PTHREADS-AVX -T 2 -m GTRGAMMA -p 12345 -x 12345 -# 1000 -f a -s kinesin_homologs_TranslatorX_Prank_align.100m.fa -n kinesin_homologs```
