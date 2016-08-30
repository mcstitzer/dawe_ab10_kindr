# Assemble tripsacum sequence from HapMap2 data

Software needed:

- phrap 1.090518, specificially, a version that can deal with short read data (ask Phil Green)
- bwa mem
- samtools
- bedtools
- bamtools
- mafft


First, get SRA reads of *Tripsacum dactyloides*, map to Kin11 and Kindr CDS from maize, and keep only mapped reads and if present, their unmapped pairs.
This is done in ```map_tripsacum.sh```

Then, extract these reads, convert to fasta with quality, and assemble with phrap.
This is done in ```bam_to_phrap_assembly.sh```.

Assembly is in ```phrap_output/``` and contigs are ```phrap_output/hapmap_tripsacum_kin.CDS.unmapped.mapped.fna.contigs```

I aligned these contigs to Kin11 and Kindr CDS from maize, and removed introns at canonical splice boundaries *GT..AG*. 

The exon-only version of the contigs are used in tree building, as the final two entries in the file here: ```kinesin_tree/kinesin_homologs_TranslatorX_Prank_align.fa```
