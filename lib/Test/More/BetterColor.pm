package Test::More::BetterColor;

our $VERSION = '0.01';

require 'Test::More';

# Ensure that Test::More is loaded
die "Test::More not found in INC\n\n" unless (exists $INC{'Test::More'});

1;
