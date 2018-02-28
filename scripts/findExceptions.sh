#!/bin/bash

if [ ! -f "$1" ]
then
	echo "Error: First argument must be a valid file" 1>&2
	exit 1
fi

echo "Feminine 1st Declension:"
cat $1 | grep -E '[^"]+ad","[^f]."'
cat $1 | grep -E '^"[^"]+am","[^f]."'
cat $1 | grep -E '^"[^"]+ag","[^f]."'
cat $1 | grep -E '^"[^"]+aed","[^f]."'
echo

echo "Masculine 2nd Declension:"
cat $1 | grep -E '^"[^"]+ul","[^m]."'
cat $1 | grep -E '^"[^"]+or","[^m]."'
cat $1 | grep -E '^"[^"]+k","[^m]."'
cat $1 | grep -E '^"[^"]+x","[^m]."'
echo

echo "Neutral 2nd Declension:"
cat $1 | grep -E '^"[^"]+id","[^n]."'
cat $1 | grep -E '^"[^"]+[^a]ed","[^n]."'
cat $1 | grep -E '^"[^"]+[^raie]d","[^n]."'
cat $1 | grep -E '^"[^"]+z","[^n]."'
cat $1 | grep -E '^"[^"]+dj","[^n]."'
cat $1 | grep -E '^"[^"]+on","[^n]."'
echo

echo "Feminine 3rd Declension:"
cat $1 | grep -E '^"[^"]+ash","[^f]."'
cat $1 | grep -E '^"[^"]+ard","[^f]."'
cat $1 | grep -E '^"[^"]+rd","[^f]."'
echo

echo "Masculine 4th Declension:"
cat $1 | grep -E '^"[^"]+b","[^m]."'
cat $1 | grep -E '^"[^"]+f","[^m]."'
cat $1 | grep -E '^"[^"]+p","[^m]."'
echo

echo "Neutral 5th Declension:"
cat $1 | grep -E '^"[^"]+ath","[^n]."'
cat $1 | grep -E '^"[^"]+at","[^n]."'
echo

echo "Nouns with verb endings:"
cat $1 | grep -E '^"[^"]+a","[fmn]."'
cat $1 | grep -E '^"[^"]+ai","[fmn]."'
echo

echo "Nouns with spaces:"
cat $1 | grep -E '^"[^"]* [^"]*","[fmn]."'
echo

echo "Irregular nouns:"
cat $1 | grep -E '^"[^"]+","[fmn]."' |\
	grep -Ev '^"[^"]*(ad|am|ag|ul|or|k|x|id|ed|d|z|dj|on|ash|ard|rd|b|f|p|ath|at)"'
echo

echo "Invalid verbs:"
cat $1 | grep -E '^"[^"]+","[v]."' | grep -Ev '^"[^"]+(a|ai)"'
