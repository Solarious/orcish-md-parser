#!/bin/bash

mkdir -p bulkReady
mkdir -p bulkReady/adjectives
mkdir -p bulkReady/nouns
mkdir -p bulkReady/verbs
mkdir -p other

cat OrcishWords.md |\
perl scripts/removeEmptyLines.pl |\
perl scripts/removePageNums.pl |\
perl scripts/toLines.pl |\
perl scripts/splitDuplicates.pl |\
perl scripts/replaceDash.pl |\
perl scripts/parse.pl |\
perl scripts/handleEmpty.pl |\
perl scripts/fixDoublePos.pl |\
perl scripts/fixPrepositions.pl |\
perl scripts/fixVulg.pl |\
perl scripts/fixPej.pl |\
perl scripts/fixExcl.pl |\
perl scripts/fixDfInEng.pl |\
perl scripts/fixOpTypos.pl |\
perl scripts/fixOptions.pl |\
perl scripts/fixPosTypos.pl |\
sort -u > other/all.csv

cat other/all.csv | perl scripts/toBulkReady.pl

split --lines='400' -a 1 --numeric-suffixes=1 --additional-suffix=.csv bulkReady/verb.csv bulkReady/verbs/verb
split --lines='400' -a 1 --numeric-suffixes=1 --additional-suffix=.csv bulkReady/noun.csv bulkReady/nouns/noun
split --lines='400' -a 1 --numeric-suffixes=1 --additional-suffix=.csv bulkReady/adjective.csv bulkReady/adjectives/adjective

cat other/all.csv | grep -o -E '^"[^"]+"' | sort | uniq -d > other/duplicateNames.csv
cat other/all.csv | grep -f other/duplicateNames.csv > other/duplicates.csv
cat bulkReady/adjective.csv | grep -v '^"[^"]*,[^"]*"' > other/invalidAdjectives.csv

cat other/all.csv | perl scripts/uniques.pl | sort | uniq -c > other/posCounts.txt

cat other/all.csv | perl scripts/checkOptions.pl > other/options.txt

cat other/all.csv | perl scripts/sortByEngLen.pl > other/sortedByEngLen.txt

sh scripts/findExceptions.sh > other/exceptions.txt
