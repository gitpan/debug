#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 10;

BEGIN { 
    use_ok('debug');
}

can_ok("debug", 'log');
can_ok("debug", 'set_log_filter');
can_ok("debug", 'set_default_log_filter');
can_ok("debug", 'remove_log_filter');

{ 
    package Foo;
    
    use debug;
    
    sub test_log_method {
        return debug->log(10) if DEBUG;
        return 20;
    }
    
    sub test_log_function {
        return debug::log(10) if DEBUG;
        return 20;
    }      
}

debug::set_log_filter(Foo => sub { $_[0] + 5 });

ok(!debug::is_debug_on("Foo"), '... debugging is off');
cmp_ok(Foo->test_log_method(), '==', 20, 
      '... debugging is off we should get 20');

debug::on("Foo");

ok(debug::is_debug_on("Foo"), '... debugging is on');
cmp_ok(Foo->test_log_function(), '==', 15, 
      '... debugging is on we should get 15 because of the log filter');

debug::remove_log_filter("Foo");
debug::set_default_log_filter(sub { $_[0] + 20 });

cmp_ok(Foo->test_log_method(), '==', 30, 
      '... debugging is on we should get 30 because of the log filter');
      
debug::off("Foo");      

{ 
    package Bar;
}

debug->remove_log_filter("Bar");
      