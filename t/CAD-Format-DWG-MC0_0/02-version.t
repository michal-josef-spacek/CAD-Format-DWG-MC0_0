use strict;
use warnings;

use CAD::Format::DWG::MC0_0;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($CAD::Format::DWG::MC0_0::VERSION, undef, 'Version.');
