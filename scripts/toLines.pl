use strict;
use warnings;

my $par = "";
while (<>) {
	my $line = $_;
	my $len = length($line);
	if ($par =~ /\*\*\n$/) {
		if ($line =~ /^\*\*/) {
			$par =~ s/\*\*\n$/\n/;
			$line =~ s/^\*\*//;
		}
		$len = length($line);
	}
	if ($line =~ /^\*\*/) {
		$par =~ s/\n/ /g;
		if (length($par) != 0) {
			print "$par\n";
		}
		$par = "";
	}
	$par .= $line;
}
$par =~ s/\n/ /g;
print "$par\n"
