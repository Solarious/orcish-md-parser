#!/bin/bash

mkdir -p bulkReady
mkdir -p bulkReady/adjectives
mkdir -p bulkReady/nouns
mkdir -p bulkReady/verbs
mkdir -p output

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
perl scripts/fixAdjMissingComma.pl |\
sort -u > output/rawAll.csv

cat output/rawAll.csv | perl scripts/makeCorrections.pl > output/all.csv

cat output/all.csv | perl scripts/toBulkReady.pl

split --lines='400' -a 1 --numeric-suffixes=1 --additional-suffix=.csv bulkReady/verb.csv bulkReady/verbs/verb
split --lines='400' -a 1 --numeric-suffixes=1 --additional-suffix=.csv bulkReady/noun.csv bulkReady/nouns/noun
split --lines='400' -a 1 --numeric-suffixes=1 --additional-suffix=.csv bulkReady/adjective.csv bulkReady/adjectives/adjective

cat output/all.csv | grep -o -E '^"[^"]+"' | sort | uniq -d > output/duplicateNames.csv
cat output/all.csv | grep -f output/duplicateNames.csv > output/duplicates.csv

cat output/all.csv | perl scripts/uniques.pl | sort | uniq -c > output/posCounts.txt

cat output/all.csv | perl scripts/checkOptions.pl > output/options.txt

cat output/all.csv | perl scripts/sortByEngLen.pl > output/sortedByEngLen.txt

./scripts/findExceptions.sh output/rawAll.csv > output/exceptionsRaw.txt
./scripts/findExceptions.sh output/all.csv > output/exceptions.txt

./scripts/getFixChanges.sh > output/fixChanges.diff
