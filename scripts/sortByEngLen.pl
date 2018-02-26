use strict;
use warnings;

sub get_eng_len {
	my $str = shift;
	$str =~ /^"[^"]+","[^"]+","([^"]+)"/;
	return length($1);
}

my @lines = ();

while(<>) {
	push @lines, $_;
}

my @sorted = sort {
	get_eng_len($b) <=> get_eng_len($a);
} @lines;

print @sorted;
