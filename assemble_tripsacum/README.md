# Assemble tripsacum sequence from HapMap2 data

Software needed:

- phrap 1.090518, specificially, a version that can deal with short read data (ask Phil Green)
- bwa mem (we used v0.7.5a-r405)
- samtools (we used v0.1.19-96b5f2294a)
- bedtools (we used v2.25)
- bamtools (we used v2.2.3)
- mafft (we used v7.245)


First, get SRA reads of *Tripsacum dactyloides*.
This is done in ```sra_to_fq.sh```.


Then, map to Kin11 and Kindr CDS from maize, and keep only mapped reads and if present, their unmapped pairs.
Next, extract these reads, convert to fasta with quality, and assemble with phrap.
This is done in ```map_tripsacum_then_assemble.sh```.

Assembly is in ```phrap_output/``` and contigs are ```phrap_output/hapmap_tripsacum_kin.CDS.unmapped.mapped.fna.contigs```

I aligned these contigs to Kin11 and Kindr CDS from maize, and removed introns at canonical splice boundaries *GT..AG*. 

The exon-only version of Contig73 (Kindr) and Contig74 (Kin11) are used in tree building, as the final two entries in the file here: ```kinesin_tree/kinesin_homologs_TranslatorX_Prank_align.fa```
