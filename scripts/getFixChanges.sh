#!/bin/bash

prev=$(cat OrcishWords.md | perl scripts/removeEmptyLines.pl | perl scripts/removePageNums.pl | perl scripts/toLines.pl | perl scripts/splitDuplicates.pl | perl scripts/replaceDash.pl | perl scripts/parse.pl | perl scripts/handleEmpty.pl)

SCRIPT_NAMES="fixDoublePos fixPrepositions fixVulg fixPej fixExcl fixDfInEng fixOpTypos fixOptions fixPosTypos fixAdjMissingComma fixAdjExtraSpace"

for NAME in ${SCRIPT_NAMES}; do
	echo "#------------${NAME}.pl:------------"
	next=$(echo "$prev" | perl scripts/${NAME}.pl)
	diff <(echo "$prev") <(echo "$next")
	echo
	echo
	echo
done
