use strict;
use warnings;

while(<>) {
	my $line = $_;
	if ($line =~ /^"[^"]*([^"]{2}), -([^"]{2})"/) {
		print "$1, -$2\n";
	} elsif ($line =~ /^"[^"]*, [^"]*"/) {
		print "customized\n";
	} else {
		print "irregular\n";
	}
}
