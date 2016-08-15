# haplotype blocks

Required software:

- R packages
	- APE


TEs were extracted manually from multiple alignments of each Kindr copy.
They are found in ```te_alignments/```, labeled as upstream, in gene (all intronic), or downstream of Kindr. 
These names correspond to those in ```TE_table_position.tab```.

Calculate the age of each LTR TE with intact LTRS with ```calculate_ages_LTRs.R```

Identify parsimony informative SNPs ```pars_inform_snps.py```

Plot everything and polarize ```plot_haplotypes.R```

