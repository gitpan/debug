#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;


# Must put use_ok() in separate BEGIN to ensure that 'use' is run before
# 	the next BEGIN block and its 'use'
BEGIN { 
    use_ok('debug' => "Foo");   
}

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
}


ok(debug->is_debug_on("Foo"), '... debugging is on');
cmp_ok(Foo->test(), '==', 10, '... debugging is on we should get 10');

