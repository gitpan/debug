#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;

BEGIN { 
    use_ok('debug');
}

ok(!exists $INC{'Data/Dumper.pm'}, '... Data::Dumper is not loaded yet');
is(Dumper([]), '$VAR1 = [];' . "\n", '... got the right Dumper output');
ok(exists $INC{'Data/Dumper.pm'}, '... Data::Dumper is now loaded');