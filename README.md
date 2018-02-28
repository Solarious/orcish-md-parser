# Orcish md to csv
A bunch of scripts that converts the orcish dictionary from markdown format to csv format, performs data cleaning, and splits the output into separate file ready to be bulkadded
## Files
Files/directories in **bold** need to be supplied by the user. Files/directories in *italics* are created by build.sh
* build.sh - Script that builds all the files in *output* and *toBulkReady* from **OrcishWords.md**
* manual.txt - Contains instructions for uploading data to Orc-dict
* **OrcishWords.md**
* stop\_words\_english.txt
* *bulkReady* - Contains csv files for uploading to Orc-dict using bulkadd
  * *[Part of Speech].csv* - All the words for the given part of speech
  * *adjectives* - Contains all the adjectives, split into multiple files to reduce upload size
  * *nouns* - Contains all the nounts, split into multiple files to reduce upload size
  * *verbs* - Contains all the verbs, split into multiple files to reduce upload size
* corrections - Files used by scripts/makeCorrections.pl
  * ei.csv - List of improvements for words with long english values
  * pos.csv - List of fixes for incorrect part of speech values
* manualBulkReady - Contains premade csv files for uploading to Orc-dict using bulkadd. Used for words that can not be generated from **OrcishWords.md**
* *output* - Contains files created by build.sh that are not bulkadd files
  * *all.csv* - Contains all the words in csv format, after corrections are make with scripts/makeCorrections.pl
  * *rawAll.csv* - Contains all the words in csv format, before corrections are make with scripts/makeCorrections.pl
  * *duplicateNames.csv* - List of orcish values that appear in multiple words
  * *duplicates.csv* - List of words that share their their orcish with another word
  * *exceptions.txt* - List of words with incorrect endings/genders in *all.csv*
  * *exceptionsRaw.txt* - List of words with incorrect endings/genders in *rawAll.csv*
  * *invalidAdjectives.csv* - List of invalid adjectives (no space or ",") in *all.csv*
  * *invalidAdjectives.csv* - List of invalid adjectives (no space or ",") in *rawAll.csv*
  * *options.txt* - List of words with invalid options (e.g. "n.a.c.b" instead of "n.a.c.b.")
  * *otherPronouns.csv* - List of demonstrative, possessive and relative pronouns
  * *posCounts.txt* - List occurences for each part of speech
  * *pronoun.csv* - List of pronouns (not including demonstrative, possessive and relative pronouns)
  * *sortedByEngLen.txt* - List of all the words, sorted by the length of their english, descending
* scripts - Contains perl and sh scripts used by build.sh
