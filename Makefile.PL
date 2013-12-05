use 5.010001;

use strict;
use warnings;

use Config;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME		=> 'Test_More_Colourise',
	VERSION		=> '0.01',
	ABSTRACT	=> 'Better coloured output for Test::More to aid legibility of failures',
	AUTHOR		=> 'J Gregory <john@johngregory.me.uk>',
	LICENSE		=> 'artistic_2',
	PREREQ_PM	=> {
		"Test::More"		=> '0.99',
		"Term::ANSIColor"	=> '4.02',
	},
	TEST_REQUIRES => {
		"Test::More" 	  	=> '0.99',
		"Test::Exception" 	=> '0.32',		
	},
	test 			=> {
		TESTS	=> 't/*.t'
	},
	'dist'          => { COMPRESS => "gzip -9", SUFFIX => "gz" },
);
