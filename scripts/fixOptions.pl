use strict;
use warnings;

while(<>) {
	my $line = $_;
	(my $rest = $line) =~ s/^("[^"]+","[^"]+","[^"]+")//;
	my $start = $1;
	my $result = $start;
	my $transformed = $rest;
	my $skip = 0;
	while ($rest =~ /"([^"]+)",?/g) {
		my $op = $1;
		if ($skip) {
			$skip = 0;
			$result .= ",\"$op\"";
			next;
		}
		if (! defined $op) { next; }
		if ($op =~ /^m\.$/) {
			$transformed =~ s/"${op}"//;
		} elsif ($op =~ /^(d\.f\.|c\.b\.|n\.a\.c\.b\.|n\.a\.|e\.i\.|p\.i\.)$/) {
			$skip = 1;
			$result .= ",\"$op\"";
		} else {
			#$op =~ s/\./\\\./g;
			$result =~ s/",?$//;
			$result .= " $op\"";
			$transformed =~ s/","\Q${op}"/ ${op}"/;
		}
	}
	#print "$start$transformed";
	print "$result\n";
}
