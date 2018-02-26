use strict;
use warnings;

while (<>) {
	my $line = $_;
	if ($line !~ /^\n$/) {
		print $line;
	}
}
