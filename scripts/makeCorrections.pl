use strict;
use warnings;

open (my $fhPosMistakes, "<", "corrections/pos.csv")
	or die "failed to open corrections/pos.csv: $1";
chomp(my @posMistakes = <$fhPosMistakes>);
close $fhPosMistakes;

open (my $fhEI, "<", "corrections/ei.csv")
	or die "failed to open corrections/ei.csv: $1";
chomp(my @eiCorrections = <$fhEI>);
close $fhEI;

while (<>) {
	my $line = $_;
	$line =~ /^"([^"]+)","([^"]+)","([^"]+)"(.*)/;
	my $orcish = $1;
	my $PoS = $2;
	my $english = $3;
	my $rest = $4;
	my $ei = "";
	for my $mistakeLine (@posMistakes) {
		if ($mistakeLine =~ /(^#|^\s*$)/) {
			next;
		}
		$mistakeLine =~ /^"([^"]+)","([^"]+)","([^"]+)"/;
		my $origOrcish = $1;
		my $origPoS = $2;
		my $newPoS = $3;
		if (($orcish eq $origOrcish) and ($PoS eq $origPoS)) {
			$PoS = $newPoS;
			last;
		}
	}

	for my $mistakeLine (@eiCorrections) {
		$mistakeLine =~ /^"([^"]+)","([^"]+)","([^"]+)","([^"]+)"/;
		my $origOrcish = $1;
		my $origPoS = $2;
		my $newEnglish = $3;
		my $newEI = $4;
		if (($orcish eq $origOrcish) and ($PoS eq $origPoS)) {
			$english = $newEnglish;
			$ei = $newEI;
			last;
		}
	}

	if ($ei eq "") {
		print "\"$orcish\",\"$PoS\",\"$english\"$rest\n";
	} else {
		print "\"$orcish\",\"$PoS\",\"$english\",\"e.i.\",\"$ei\"$rest\n";
	}
}
