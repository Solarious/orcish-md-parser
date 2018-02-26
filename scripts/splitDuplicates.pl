use strict;
use warnings;

while (<>) {
	splitDup($_);
}

sub splitDup {
	my ($line) = @_;
	if ($line =~ /^(\*\*[^*]+\*\*.*?)(\*\*[^\*]+\*\*.*)$/) {
		print "$1\n";
		splitDup("$2\n");
	} else {
		print $line;
	}
}
