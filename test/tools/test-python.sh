#!/bin/sh

export srcdir=`pwd`

for tool in calculate compare compose concatenate conjunct determinize \
	    disjunct format fst2strings head invert minimize pmatch2fst pmatch \
	    project prune-alphabet push-weights regexp2fst remove-epsilons \
	    repeat reverse shuffle split subtract tail txt2fst;
do
    printf "%-20s" $tool"..."
    ./$tool-functionality.sh --python
    retval=$?
    if [ $retval -eq 0 ]; then
	printf '%s\n' 'pass'
    elif [ $retval -eq 77 ]; then
	printf '%s\n' 'skip'
    else
	printf '%s\n' 'fail'
    fi
done

# todo: not yet implemented:
# compose-intersect flookup fst2txt lexc-compiler-flags lexc-compiler
# lexc-wrapper lookup optimized-lookup pmatch proc
# reweight strings2fst substitute
# summarize symbol-harmonization tokenize-backtrack
# tokenize-flushing tokenize

# fst2fst-functionality doesn't exist
