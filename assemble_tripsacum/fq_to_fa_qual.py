#!/usr/bin python

import sys
import os
from Bio import SeqIO
#from future import standard_library
#standard_library.install_aliases()
#from subprocess import getoutput, getstatusoutput
#from subprocess import getstatusoutput
## python2
#from commands import getoutput
#from Bio import SeqIO


fq = sys.argv[1]
fa = sys.argv[2]
qual = sys.argv[3]

SeqIO.convert(fq, "fastq", qual, "qual")
SeqIO.convert(fq, "fastq", fa, "fasta")
