# haplotype blocks

Required software:

- R packages
	- APE (we used v4.1)


TEs were extracted manually from multiple alignments of each Kindr copy.
They are found in ```te_alignments/```, labeled as upstream, in gene (all intronic), or downstream of Kindr. 
These names correspond to those in ```TE_table_position.tab```.

Calculate the age of each LTR TE with intact LTRS with ```calculate_ages_LTRs.R```

 - this makes use of the TE alignment files in ```te_alignments/```

Identify parsimony informative SNPs ```pars_inform_snps.py```

 - ```python pars_inf_snps.py ALL_KINDR_TE_REMOVED_UP-GENE-DOWN.fa > parsimony_informative_ALL_UP-GENE-DOWN.csv```

Plot everything and polarize ```plot_haplotypes.R```

