#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my ($tl, $tw, $tc) = (0,0,0);

foreach my $fname (@ARGV) {
	open(FILE, '<'.$fname) or die "Could not open file: $!";

	my ($l, $w, $c) = (0,0,0);

	while (<FILE>) {
		$l++;
		$c += length($_);
		$w += scalar(split(/\s+/, $_));
	}

	$tl += $l;
	$tw += $w;
	$tc += $c;

	print("$l $w $c $fname\n");
}

if (scalar(@ARGV) > 1) {
	print("$tl $tw $tc total\n");
}
