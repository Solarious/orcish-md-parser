use strict;
use warnings;

while(<>) {
	my $line = $_;
	$line =~ s/^("[^"]+",)"n","[\. ]+/$1"n\.","/;
	print $line;
}
