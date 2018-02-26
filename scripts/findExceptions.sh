#!/bin/bash

echo "Feminine 1st Declension:"
cat other/all.csv | grep -E '[^"]+ad","[^f]."'
cat other/all.csv | grep -E '^"[^"]+am","[^f]."'
cat other/all.csv | grep -E '^"[^"]+ag","[^f]."'
cat other/all.csv | grep -E '^"[^"]+aed","[^f]."'
echo

echo "Masculine 2nd Declension:"
cat other/all.csv | grep -E '^"[^"]+ul","[^m]."'
cat other/all.csv | grep -E '^"[^"]+or","[^m]."'
cat other/all.csv | grep -E '^"[^"]+k","[^m]."'
cat other/all.csv | grep -E '^"[^"]+x","[^m]."'
echo

echo "Neutral 2nd Declension:"
cat other/all.csv | grep -E '^"[^"]+id","[^n]."'
cat other/all.csv | grep -E '^"[^"]+ed","[^n]."'
cat other/all.csv | grep -E '^"[^"]+[^ra]d","[^n]."'
cat other/all.csv | grep -E '^"[^"]+z","[^n]."'
cat other/all.csv | grep -E '^"[^"]+dj","[^n]."'
echo

echo "Feminine 3rd Declension:"
cat other/all.csv | grep -E '^"[^"]+ash","[^f]."'
cat other/all.csv | grep -E '^"[^"]+ard","[^f]."'
cat other/all.csv | grep -E '^"[^"]+rd","[^f]."'
echo

echo "Masculine 4th Declension:"
cat other/all.csv | grep -E '^"[^"]+b","[^m]."'
cat other/all.csv | grep -E '^"[^"]+f","[^m]."'
cat other/all.csv | grep -E '^"[^"]+p","[^m]."'
echo

echo "Neutral 5th Declension:"
cat other/all.csv | grep -E '^"[^"]+ath","[^n]."'
cat other/all.csv | grep -E '^"[^"]+at","[^n]."'
echo

echo "Nouns with verb endings:"
cat other/all.csv | grep -E '^"[^"]+a","[fmn]."'
cat other/all.csv | grep -E '^"[^"]+ai","[fmn]."'
echo

echo "Nouns with spaces:"
cat other/all.csv | grep -E '^"[^"]* [^"]*","[fmn]."'
echo

echo "Irregular nouns:"
cat other/all.csv | grep -E '^"[^"]+","[fmn]."' |\
	grep -Ev '^"[^"]*(ad|am|ag|ul|or|k|x|id|ed|d|z|dj|ash|ard|rd|b|f|p|ath|at)"'
echo

echo "Invalid verbs:"
cat other/all.csv | grep -E '^"[^"]+","[v]."' | grep -Ev '^"[^"]+(a|ai)"'
