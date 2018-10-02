### Evolutionary analyses for [Dawe et al., 2018](http://www.cell.com/cell/abstract/S0092-8674(18)30289-7), *A Kinesin-14 Motor Activates Neocentromeres to Promote Meiotic Drive in Maize*

Data and scripts included to:

1. ```assemble_tripsacum/``` perform a local assembly of tripsacum kinesins

2. ```kinesin_tree/``` build tree of related kinesins

3. ```positive_selection/``` test for positive selection on kindr copies using BUSTED

4. ```kinesin_divergence_dating/``` date origin of kindr array

5. ```identify_haplotypes/``` characterize IBS regions and plot haplotypes
	- on this `blast-fix` branch, we alter blast parameters in ```identify_haplotypes/te_alignments/blast_tes.sh``` in response to [Issue #1](/../../issues/1)
	- the best hits presented in ```identify_haplotypes/TE_table_position.tab``` do not change when avoiding use of the `max_target_seqs` parameter in blast

