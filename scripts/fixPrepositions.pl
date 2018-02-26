use strict;
use warnings;

while(<>) {
	my $line = $_;
	# move ,"conj." to end of line if it is not one of the first 2 values
	# fixDoublePos.pl probably makes this redundant, code kept just in case
	if ($line =~ /^("[^"]+","[^"]+".*)(,"conj\.")(.*)$/) {
		my $start = $1;
		my $conj = $2;
		my $end = $3;
		$line = "$start$end$conj\n";
	}
	# handle "with","gen." and "with","acc."
	if ($line =~ /^("[^"]+","prep\.",)"with","(gen\.|acc\.)","([^"]+)"(.*)$/) {
		my $start = $1;
		my $case = $2;
		my $english = $3;
		my $end = $4;
		if ($case eq "gen.") {
			$case = "gentitve";
		}
		if ($case eq "acc.") {
			$case = "accusative";
		}
		print "$start\"$english\",\"e.i.\",\"with $case\"$end\n";
	} else {
		# if not a preposition, remove part
		$line =~ s/,"with","(gen\.|acc\.)"//;
		print $line;
	}
}
