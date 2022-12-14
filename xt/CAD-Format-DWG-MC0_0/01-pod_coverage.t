use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('CAD::Format::DWG::MC0_0', 'CAD::Format::DWG::MC0_0 is covered.');
