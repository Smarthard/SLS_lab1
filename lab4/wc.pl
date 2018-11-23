#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use Getopt::Std;

my %opt=();
my ($tl, $tw, $tc) = (0,0,0);

#########################################################################
#				MAIN					#
#########################################################################

getopts("cCmlw", \%opt);

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
	
	print "$c " if $opt{c} or $opt{C} or $opt{m};
	print "$l " if $opt{l};
	print "$w " if $opt{w};
	print "$l $w $c " if %opt == 0;
	print "$fname\n";
}

if (scalar(@ARGV) > 1) {
	print "$tc " if $opt{c} or $opt{C} or $opt{m};
	print "$tl " if $opt{l};
	print "$tw " if $opt{w};
	print "$tl $tw $tc " if %opt == 0;
	print "total\n";
}
