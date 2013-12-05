#!/usr/bin/env perl

use strict;
use warnings;

use Test::Exception tests => 1;
throws_ok{ require Test::More::Colourise }
	qr/Test::More not found in INC/,
	"Requires Test::More to be loaded!";
