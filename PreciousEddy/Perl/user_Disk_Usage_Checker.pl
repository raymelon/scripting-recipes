#!/usr/bin/perl

use strict;
use warnings;

my @users = qw(user1 user2 user3);

foreach my $user (@users) {
    my $usage = `du -sh /home/$user | awk '{print \$1}'`;
    chomp $usage;
    print "User $user Disk Usage: $usage\n";
}
