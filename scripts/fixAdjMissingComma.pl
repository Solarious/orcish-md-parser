use strict;
use warnings;

while(<>) {
	my $line = $_;
	if ($line =~ /^"([^"]+)","(adj\.)"(.*)$/) {
		my $orcish = $1;
		my $end = $3;
		if ($orcish =~ /^([^",]+) (-[^"]+)$/) {
			my $left = $1;
			my $right = $2;
			print "\"$left, $right\",\"adj.\"$end\n";
			next;
		}
	}

	print $line;
}
