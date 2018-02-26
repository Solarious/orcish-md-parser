use strict;
use warnings;

while(<>) {
	my $line = $_;
	(my $rest = $line) =~ s/^"[^"]+","[^"]+","[^"]+",?//;
	my $skip = 0;
	while ($rest =~ /"([^"]+)"(,"[^"]+")?,?/g) {
		if ($skip) {
			$skip = 0;
			next;
		}
		my $op = $1;
		my $value = $2;
		if (! defined $op) { next; }
		if (! defined $value) {
			print $line;
			print "\t$op has no value\n";
		}
		if ($op !~ /^(d\.f\.|c\.b\.|n\.a\.|n\.a\.c\.b\.|e\.i\.|p\.i\.)$/) {
			print $line;
			print "\t$op is not a valid operation\n";
		} else {
			$skip = 1;
		}
	}
}
