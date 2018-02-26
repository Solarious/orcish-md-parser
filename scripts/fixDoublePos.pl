use strict;
use warnings;

while(<>) {
	my $line = $_;
	if ($line =~ /^"([^"]+)","([^"]+)"(.*),"(prep\.|pron\.|adv\.|conj\.)"(.*)$/) {
		my $orcish = $1;
		my $pos = $2;
		my $middle = $3;
		my $otherPos = $4;
		my $end = $5;
		print "\"$orcish\",\"$pos\"$middle$end\n";
		print "\"$orcish\",\"$otherPos\"$middle$end\n";
	} else {
		print $line;
	}
}
