#!perl

use strict;
use warnings;

use Test::More 0.88 tests => 3;
use PAUSE::Permissions;

# turn off downloading the permissions file temporarily
{
    local *PAUSE::Permissions::_cache_file_if_needed = sub { 1 };

    is(PAUSE::Permissions->new->url, 'http://www.cpan.org/modules/06perms.txt', 'Default URL is correct');
    is(PAUSE::Permissions->new(url => 'http://example.org')->url, 'http://example.org', 'Passing URL to constructor works');

    {
        local $ENV{PAUSE_PERMISSIONS_URL} = 'http://example.com';
        is(PAUSE::Permissions->new->url, 'http://example.com', 'Setting URL via environment works');
    }
}



