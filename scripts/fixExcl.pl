use strict;
use warnings;

while(<>) {
	my $line = $_;
	if ($line =~ /^"([^"]+)","([^"]+)","([^"]+)"(.*),"(excl\.)","([^"]+)"(.*)$/) {
		my $orcish = $1;
		my $pos = $2;
		my $eng = $3;
		my $middle = $4;
		my $otherPos = $5;
		my $otherEng = $6;
		my $end = $7;
		print "\"$orcish\",\"$pos\",\"$eng\"$middle$end\n";
		print "\"$orcish\",\"$otherPos\",\"$otherEng\"$middle$end\n";
	} else {
		print $line;
	}
}
