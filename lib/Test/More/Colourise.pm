package Test::More::Colourise;

our $VERSION = '0.01';

use v5.10;

use strict;
use warnings;

#use Test::More;
#use Test::Builder;

use Term::ANSIColor qw(:constants);

# Ensure that Test::More is loaded
die "Test::More not found in INC\n\n" unless (exists $INC{'Test/More.pm'});

my $bold  = BOLD;
my $yellow= YELLOW;
my $green = GREEN;
my $red   = RED;
my $grey  = FAINT;
my $reset = RESET;


no warnings 'redefine';

*Test::Builder::_print_to_fh = sub {
	my ( $self, $fh, @msgs ) = @_;
 
	state $colour_on = '';

    # Prevent printing headers when only compiling.  Mostly for when
    # tests are deparsed with B::Deparse
    return if $^C;
 
    my $msg = join '', @msgs;
    my $indent = $self->_indent;
 
    local( $\, $", $, ) = ( undef, ' ', '' );
 
    # Escape each line after the first with a # so we don't
    # confuse Test::Harness.
    $msg =~ s{\n(?!\z)}{\n$indent# }sg;
 
    # Stick a newline on the end if it needs it.
    $msg .= "\n" unless $msg =~ /\n\z/;

    # Determine the colour for the line
    if ($msg =~ /^(# +Failed test )('.+)$/) {
    	$msg = "$red$1$bold$2$reset\n";
    }
    elsif ($msg =~ /^(# +at.+)(line \d+\.)$/) {
    	$msg = "$grey$1$2$reset\n";
    }
    elsif ($msg =~ /got:/) {
    	$msg =~ s/(# +)(got:)(.+)/$yellow$1$bold$2$reset$yellow$3/gms;
    	$msg =~ s/(# +)(expected:)(.+)/$green$1$bold$2$reset$green$3/gms;
    	$msg .= $reset;    	
    }
 
    return print $fh $indent, $msg;
};


1;
