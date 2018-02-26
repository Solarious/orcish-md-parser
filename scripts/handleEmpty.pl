use strict;
use warnings;

while(<>) {
	my $line = $_;
	# handle lines with "vug." or "pej."
	if ($line =~ /^("[^"]+","[^"]+",)"","([^"]+)","([^"]+)"(.*)$/) {
		my $front = $1;
		my $type = $2;
		my $desc = $3;
		my $end = $4;
		my $newDesc = "$desc ($type)";
		if (($type eq "vug.") or ($type eq "pej.")) {
			$line = "$front\"$newDesc\"$end\n";
		}
	}
	$line =~ s/,""//g;
	print $line;
}
