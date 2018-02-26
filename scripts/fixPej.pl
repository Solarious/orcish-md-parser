use strict;
use warnings;

while(<>) {
	my $line = $_;
	if ($line =~ /^("[^"]+","[^"]+",)("[^"]+")(.*),"pej\.","([^"]+)"(.*)$/) {
		my $orcPos= $1;
		my $eng = $2;
		my $before = $3;
		my $pejEng = $4;
		my $end = $5;
		print "$orcPos$eng$before$end\n";
		print "$orcPos\"$pejEng\",\"e.i.\",\"pejorative\"$end\n";
	} else {
		print $line;
	}
}
