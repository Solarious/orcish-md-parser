use strict;
use warnings;
use Switch;

open (my $fhAdjective, ">", "bulkReady/adjective.csv") or die "Failed to open bulkReady/adjective.csv: $!";
open (my $fhAdverb, ">", "bulkReady/adverb.csv") or die "Failed to open bulkReady/adverb.csv: $!";
open (my $fhOther, ">", "bulkReady/other.csv") or die "Failed to open bulkReady/other.csv: $!";
open (my $fhCardinal, ">", "bulkReady/cardinal.csv") or die "Failed to open bulkReady/cardinal.csv: $!";
open (my $fhConjunction, ">", "bulkReady/conjunction.csv") or die "Failed to open bulkReady/conjunction.csv: $!";
open (my $fhOtherPronouns, ">", "other/otherPronouns.csv") or die "Failed to open other/otherPronouns.csv: $!";
open (my $fhExclamation, ">", "bulkReady/exclamation.csv") or die "Failed to open bulkReady/exclamation.csv: $!";
open (my $fhNoun, ">", "bulkReady/noun.csv") or die "Failed to open bulkReady/noun.csv: $!";
open (my $fhPreposition, ">", "bulkReady/preposition.csv") or die "Failed to open bulkReady/preposition.csv: $!";
open (my $fhPronoun, ">", "other/pronoun.csv") or die "Failed to open other/pronoun.csv: $!";
open (my $fhVerb, ">", "bulkReady/verb.csv") or die "Failed to open bulkReady/verb.csv: $!";
open (my $fhAffix, ">", "bulkReady/affix.csv") or die "Failed to open bulkReady/affix.csv: $!";

while(<>) {
	my $line = $_;
	$line =~ /^("[^"]+"),"([^"]+)",(.*)$/;
	my $front = $1;
	my $part = $2;
	my $end = $3;
	switch ($part) {
		case ("adj.") { print $fhAdjective "$front,\"adjective\",$end\n"; }
		case ("adv.") { print $fhAdverb "$front,\"adverb\",$end\n"; }
		case ("card.") { print $fhCardinal "$front,\"cardinal\",$end\n"; }
		case ("conj.") { print $fhConjunction "$front,\"conjunction\",$end\n"; }
		case ("cont.") { print $fhOther "$front,\"contraction\",$end\n"; }
		case ("dem.") { print $fhOtherPronouns "$front,\"demonstrative\",$end\n"; }
		case ("excl.") { print $fhExclamation "$front,\"exclamation\",$end\n"; }
		case ("f.") { print $fhNoun "$front,\"noun\",$end\n"; }
		case ("intj.") { print $fhOther "$front,\"interjection\",$end\n"; }
		case ("m.") { print $fhNoun "$front,\"noun\",$end\n"; }
		case ("n.") { print $fhNoun "$front,\"noun\",$end\n"; }
		case ("other.") {
			if ($front !~ /^"aka"$/) { print $fhOther "$front,\"contraction\",$end\n"; }
		}
		case ("poss.") { print $fhOtherPronouns "$front,\"possessive\",$end\n"; }
		case ("pref.") { print $fhAffix "$front,\"prefix\",$end\n"; }
		case ("prep.") { print $fhPreposition "$front,\"preposition\",$end\n"; }
		case ("pron.") { print $fhPronoun "$front,\"pronoun\",$end\n"; }
		case ("rel.") { print $fhOtherPronouns "$front,\"relative\",$end\n"; }
		case ("suff.") { print $fhAffix "$front,\"suffix\",$end\n"; }
		case ("v.") { print $fhVerb "$front,\"verb\",$end\n"; }
		else { print $fhOther "$front,\"unknown\",$end\n"; }
	}
}

close $fhAdjective;
close $fhAdverb;
close $fhOther;
close $fhOtherPronouns;
close $fhExclamation;
close $fhNoun;
close $fhPreposition;
close $fhPronoun;
close $fhVerb;
close $fhAffix;
