#!/usr/bin/perl

use strict;
use warnings;

my $uname = `uname -a`;
my $uptime = `uptime`;
my $df = `df -h`;

print "=== System Information ===\n";
print "Hostname: ", `hostname`;
print "Kernel: $uname";
print "Uptime: $uptime";
print "Disk Usage: $df";
