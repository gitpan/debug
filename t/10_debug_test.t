#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 11;

BEGIN { 
    # create the Foo package
    { 
        package Foo;
        
        use debug;
        
        sub test {
            return 10 if DEBUG;
            return 20;
        }
    }
    # turn debugging on for Foo
    use_ok('debug' => "Foo");   
}

can_ok("debug", 'is_debug_on');
can_ok("debug", 'on');
can_ok("debug", 'off');

ok(debug->is_debug_on("Foo"), '... debugging is on');
cmp_ok(Foo->test(), '==', 10, '... debugging is on we should get 10');

debug->off("Foo");

ok(!debug->is_debug_on("Foo"), '... debugging is off');
cmp_ok(Foo->test(), '==', 20, '... debugging is off we should get 20');

debug->on("Foo");

ok(debug->is_debug_on("Foo"), '... debugging is on');
cmp_ok(Foo->test(), '==', 10, '... debugging is on we should get 10');

{ 
    package Bar;
}

ok(!debug->is_debug_on("Bar"), '... debugging is off again');
