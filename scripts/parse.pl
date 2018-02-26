use strict;
use warnings;

sub prettify {
	my $str = shift;
	if ($str) {
		$str =~ s/^ //g;
		$str =~ s/ $//g;
		$str =~ s/;$//g;
		$str =~ s/,$//g;
	}
	return $str;
}

while(<>) {
	my $line = $_;
	$line =~ /^\*\*([^\*]+)\*\*\s*\*([^\*]+)\*(.*)$/;
	my $orcish = prettify($1);
	my $PoS = prettify($2);
	my $rest = $3;
	if (!defined($rest)) {
		$line =~ /^\*\*([^\*]+)\*\*(.*)$/;
		$orcish = prettify($1);
		$PoS = "other.";
		$rest = prettify($2);
	}
	$rest =~ /^([^\*]+)(.*)$/;
	my $desc = prettify($1);
	my $opts = $2;
	print "\"$orcish\",\"$PoS\",\"$desc\"";
	while ($opts =~ /\*([^\*]+)\*([^\*]+)/g) {
		my $part1 = prettify($1);
		my $part2 = prettify($2);
		print ",\"$part1\",\"$part2\"";
	}
	print "\n";
}
