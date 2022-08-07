package Data::HTML::Form::Input;

use strict;
use warnings;

use Error::Pure qw(err);
use List::Util qw(none);
use Mo qw(build is);
use Mo::utils qw(check_bool check_number check_required);
use Readonly;

Readonly::Array our @TYPES => qw(checkbox submit text);

our $VERSION = 0.01;

has checked => (
	is => 'ro',
);

has css_class => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has label => (
	is => 'ro',
);

has placeholder => (
	is => 'ro',
);

has readonly => (
	is => 'ro',
);

has required => (
	is => 'ro',
);

has size => (
	is => 'ro',
);

has value => (
	is => 'ro',
);

has type => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check checked.
	check_bool($self, 'checked');

	# Check readonly.
	check_bool($self, 'readonly');

	# Check required.
	check_bool($self, 'required');

	# Check size.
	check_number($self, 'size');

	# Check type.
	check_required($self, 'type');
	if (none { $self->{'type'} eq $_ } @TYPES) {
		err "Parameter 'type' has bad value.";
	}

	return;
}

1;

__END__
