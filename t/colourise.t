#!/usr/bin/env perl

use strict;

use Test::More;
use Test::More::Colourise;

is(
	qq|Good news, everyone! I've taught the toaster\nto feel love! No! I want to live!\nThere are still too many things I don't own! Daddy Bender, we're hungry.|,
	qq|Ah, the 'Breakfast Club' soundtrack! I can't wait til I'm old enough to feel\n ways about stuff! Oh, I don't have\n time for this. I have to go and buy a single piece of fruit with a coupon and then return it, making people wait behind me while I complain.|,
	'These don\'t match');

done_testing();
