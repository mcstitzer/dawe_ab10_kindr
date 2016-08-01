# Assemble tripsacum sequence from HapMap2 data

Software needed:

- phrap 1.090518, specificially, a version that can deal with short read data (ask Phil Green)
- bwa mem
- samtools
- bedtools
- qiime ## although I have changed this! think about whether I should here as well.
- mafft

Once Kindr has a NCBI accession number, can grab that as well here, but just including the fasta reference of ZmKindr CDS and ZmKin11 CDS for now.


Assembly is in ```phrap_output/``` and contigs are ```hapmap_tripsacum_kin.CDS.unmapped.mapped.fna.contigs```

I aligned these to each exon of ZmKin11 and ZmKindr ```hapmap_tripsacum_mapped_to_CDS.fa``` and removed introns at canonical splice boundaries *GT..AG*. 

The exon-only version of the contig is ```hapmap_tripsacum_kindr_kin11_CDS_contigs.fa```
