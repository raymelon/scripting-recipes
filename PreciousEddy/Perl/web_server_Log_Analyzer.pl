#!/usr/bin/perl

use strict;
use warnings;

my $log_file = "/path/to/access.log";

open my $fh, '<', $log_file or die "Could not open file: $!";
my @lines = <$fh>;
close $fh;

my $total_requests = scalar @lines;
my %request_counts;

foreach my $line (@lines) {
    my ($request) = $line =~ /"([A-Z]+) /;
    $request_counts{$request}++;
}

print "=== Web Server Log Statistics ===\n";
print "Total Requests: $total_requests\n";
foreach my $request (keys %request_counts) {
    print "$request: $request_counts{$request}\n";
}
