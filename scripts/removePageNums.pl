use strict;
use warnings;

while (<>) {
	my $line = $_;
	if ($line !~ /^\*\*[^\*]+\*\*$/) {
		print($line);
	}
}
