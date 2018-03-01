use strict;
use warnings;

# fixes gatta

while(<>) {
	my $line = $_;
	if ($line =~ /^("[^"]+","[^"]+","[^"]+?);? d\.f\."(.*)$/) {
		my $start = $1;
		my $end = $2;
		print "$start\",\"d.f.\"$end\n";
	} else {
		print $line;
	}
}
