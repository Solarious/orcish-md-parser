use strict;
use warnings;

while(<>) {
	my $line = $_;
	if ($line =~ /^"([^"]+), - ([^"]+)","adj\."(.*)$/) {
		my $left = $1;
		my $right = $2;
		my $end = $3;
		print "\"$left, -$right\",\"adj.\"$end\n";
	} else {
		print $line;
	}
}
