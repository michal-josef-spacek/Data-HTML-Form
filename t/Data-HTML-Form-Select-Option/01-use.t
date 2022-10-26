use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Data::HTML::Form::Select::Option');
}

# Test.
require_ok('Data::HTML::Form::Select::Option');
