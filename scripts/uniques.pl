use strict;
use warnings;

while(<>) {
	my $line = $_;
	$line =~ /^("[^"]+",")([^"]+)(",.*)$/;
	print "$2\n";
}
