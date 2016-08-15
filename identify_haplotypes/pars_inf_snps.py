## find parsimony informative sites in multifasta alignment, output csv file of position and snp. 
## relies on aligned fasta, only characters as ACTG-
## prints csv to STDOUT

import sys
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from collections import Counter

seqs=list(SeqIO.parse(open('ALL_KINDR_TE_REMOVED_UP-GENE-DOWN.fa'), "fasta"))

## set up a dictionary to populate with each parsimony informative site
parsinf={}
for i in seqs:
    parsinf[i.id]=[]

## keep track of the position of parsimony informative sites in the original alignment
parsposn=[]

## go through and check every position in the original alignment
for i in range(0, len(seqs[0].seq)):
	tempseq=[]
	for seq in seqs:
		tempseq.append(seq.seq[i].upper())
	c=Counter(tempseq)
#	print c
	nomissing=len(tempseq) - c['-']
#	print nomissing
	if len(c)>1:
		basecount=[c['A'], c['C'], c['G'], c['T'], c['-']]
#		print basecount
## this is not working, don't know why, will just use max instead
#		if all(x < nomissing for x in basecount[0:4])==True: ## then we have a parsimony informative site
		if max(basecount[0:4]) < nomissing-1:
#			print 'parsimony informative!'
			for x in basecount[0:4]:
				if x > nomissing:
					print x
#			print basecount
#			print nomissing
			for entry in seqs:
				parsinf[entry.id].append(entry.seq[i].upper())
			parsposn.append(i+1)


print 'seqname'+',' + ','.join(map(str, parsposn))
for entry in parsinf:
	print entry + ',' + ','.join(parsinf[entry])