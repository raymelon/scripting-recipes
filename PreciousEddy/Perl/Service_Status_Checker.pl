#!/usr/bin/perl

use strict;
use warnings;

my $service_name = "service_name";

my $status = `systemctl is-active $service_name`;

if ($status =~ /active/) {
    print "$service_name is running.\n";
} else {
    print "$service_name is not running.\n";
}
