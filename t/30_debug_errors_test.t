#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 7;

BEGIN { 
    use_ok('debug');
}

eval {
    debug->set_log_filter("Foo");
};
like($@, 
    qr/debug module exception\: the filter must be a subroutine reference/,
    '... got the error we expected');

eval {
    debug->set_log_filter("Foo" => "Fail");
};
like($@, 
    qr/debug module exception\: the filter must be a subroutine reference/,
    '... got the error we expected');

eval {
    debug->set_log_filter("Foo" => []);
};
like($@, 
    qr/debug module exception\: the filter must be a subroutine reference/,
    '... got the error we expected');
    
eval {
    debug->set_default_log_filter();
};
like($@, 
    qr/debug module exception\: the filter must be a subroutine reference/,
    '... got the error we expected');

eval {
    debug->set_default_log_filter("Fail");
};
like($@, 
    qr/debug module exception\: the filter must be a subroutine reference/,
    '... got the error we expected');

eval {
    debug->set_default_log_filter([]);
};
like($@, 
    qr/debug module exception\: the filter must be a subroutine reference/,
    '... got the error we expected');    