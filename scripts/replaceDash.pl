use strict;
use warnings;

while(<>) {
	my $line = $_;
	$line =~ s/–/-/g;
	print $line;
}
