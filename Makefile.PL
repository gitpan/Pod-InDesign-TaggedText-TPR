# $Id: Makefile.PL,v 1.4 2004/07/04 17:04:17 comdog Exp $
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'	       => 'Pod::InDesign::TaggedText::TPR',
	'ABSTRACT'     => 'Convert Pod to InDesign\'s Tagged Text format for The Perl Review',
	'VERSION_FROM' => 'lib/TPR.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'Pod::InDesign::TaggedText' => '0',
		'Pod::Simple'               => '0',
		'Pod::Escapes'              => '0',
		'Test::LongString'          => '0',
		},

	'PM'           => {
		'lib/TPR.pm'         => '$(INST_LIBDIR)/TPR.pm',
		},

	'EXE_FILES'    =>  [ 'script/pod2tpr' ],

	'MAN3PODS'     => {
		'lib/TPR.pm' => '$(INST_MAN3DIR)/Pod::InDesign::TaggedText::TPR.3',
		},

	clean  => { FILES    => q|Pod-InDesign-TaggedText-*| },
	);
