use strict;
use warnings;

while(<>) {
	my $line = $_;
	$line =~ s/"n\.a\.c\.b"/"n\.a\.c\.b\."/;
	$line =~ s/"n\.d\."/"n\.a\."/;
	$line =~ s/"; d\.f\."/"d\.f\."/;
	print $line;
}
