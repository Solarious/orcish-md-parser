use strict;
use warnings;

while(<>) {
	my $line = $_;
	if ($line =~ /^("[^"]+","[^"]+"),"vulg\."(.*)$/) {
		my $start = $1;
		my $end = $2;
		print "$start$end,\"e\.i\.\",\"vulgar\"\n";
	} else {
		print $line;
	}
}
