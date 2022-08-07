package Data::HTML::Form;

use strict;
use warnings;

use Error::Pure qw(err);
use List::Util qw(none);
use Mo qw(build is);
use Readonly;

Readonly::Array our @METHODS => qw(get post);

our $VERSION = 0.01;

has action => (
	is => 'ro',
);

has css_class => (
	is => 'ro',
);

has enctype => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has label => (
	is => 'ro',
);

has method => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check method.
	if (! defined $self->{'method'}) {
		$self->{'method'} = 'get';
	}
	if (none { $self->{'method'} eq $_ } @METHODS) {
		err "Parameter 'method' has bad value.";
	}

	return;
}

1;

__END__
