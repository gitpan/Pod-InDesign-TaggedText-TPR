# $Id$
package Pod::InDesign::TaggedText::TPR;
use strict;
use base 'Pod::InDesign::TaggedText';

use warnings;
no warnings;

use subs qw();
use vars qw($VERSION);

$VERSION = '0.10';

=head1 NAME

Pod::InDesign::TaggedText - Turn Pod into Tagged Text for The Perl Review

=head1 SYNOPSIS

	use Pod::InDesign::TaggedText::TPR;

=head1 DESCRIPTION

***THIS IS ALPHA SOFTWARE. MAJOR PARTS WILL CHANGE***

This module overrides and extends C<Pod::InDesign::TaggedText> to translate
Pod into the InDesign Tagged Text format used by The Perl Review.

=cut

sub document_header  
	{
	<<'HTML';
<ASCII-MAC>
<Version:5><FeatureSet:InDesign-Roman><ColorTable:=<Black:COLOR:CMYK:Process:0,0,0,1>>
<DefineCharStyle:pod-I=<Nextstyle:pod-I><cColor:Black><cTypeface:Italic><cSize:9.500000><cHorizontalScale:1.000000><cTracking:0><cBaselineShift:0.000000><cCase:Normal><cStrokeColor:None><cLanguage:English\: USA><cUnderline:0><cFont:Minion \(T1\)><cPosition:Normal><cStrikethru:0><cColorTint:-1.000000>>
<DefineCharStyle:pod-C=<Nextstyle:pod-C><cColor:Black><cTypeface:Regular><cSize:9.500000><cHorizontalScale:1.000000><cTracking:0><cBaselineShift:0.000000><cCase:Normal><cStrokeColor:None><cUnderline:0><cFont:Courier New><cPosition:Normal><cStrikethru:0><cColorTint:-1.000000>>
<DefineCharStyle:pod-B=<Nextstyle:pod-B><cColor:Black><cTypeface:Bold><cSize:9.500000><cHorizontalScale:1.000000><cTracking:0><cBaselineShift:0.000000><cCase:Normal><cStrokeColor:None><cUnderline:0><cFont:Courier New><cPosition:Normal><cStrikethru:0><cColorTint:-1.000000>>
<DefineParaStyle:NormalParagraphStyle=<Nextstyle:NormalParagraphStyle>>
<DefineParaStyle:Feature Section=<BasedOn:NormalParagraphStyle><Nextstyle:Feature Section><cTypeface:Bold><cSize:10.000000><pSpaceBefore:4.500000><pTabRuler:20\,Left\,.\,0\,-\;258\,Left\,.\,0\,-\;><cFont:Rockwell><pGridAlign:BaseLine>>
<DefineParaStyle:Module Author Byline=<Nextstyle:Module Author Byline><cTypeface:Italic><cSize:9.500000><cLigatures:0><pDropCapCharacters:1><pDropCapLines:1><pHyphenationLadderLimit:0><cLanguage:English\: USA><pHyphenation:0><pHyphenationZone:0.000000><cFont:Minion \(T1\)><pMaxLetterspace:0.050000><pMinLetterspace:-0.020000><pMaxGlyphScale:1.050000><pMinGlyphScale:0.950000><cHang:Baseline><pSingleWordAlignment:Left><pTextAlignment:Right><pGridAlign:BaseLine><bulFont:\<TextFont\>><bulTypeFace:\<TextStyle\>>>
<DefineParaStyle:Feature Lead=<Nextstyle:Feature Lead><cSize:9.500000><cLigatures:0><cTracking:50><pDropCapCharacters:1><pDropCapLines:3><pHyphenationLadderLimit:0><cLeading:11.400000><cLanguage:English\: USA><pHyphenation:0><pHyphenationZone:0.000000><cFont:Minion \(T1\)><pMaxLetterspace:0.050000><pMinLetterspace:-0.020000><pMaxGlyphScale:1.050000><pMinGlyphScale:0.950000><cHang:Baseline><pSingleWordAlignment:Left><pTextAlignment:JustifyLeft><pGridAlign:BaseLine>>
<DefineParaStyle:Feature Para=<BasedOn:Feature Lead><Nextstyle:Feature Para><pDropCapLines:1><pFirstLineIndent:12.024000>>
<DefineParaStyle:Feature Section Lead=<BasedOn:Feature Para><Nextstyle:Feature Section Lead><pFirstLineIndent:0.000000><cLeading:-1.000000>>
<DefineParaStyle:Feature Code Para=<Nextstyle:Feature Code Para><cSize:9.500000><cLigatures:0><pHyphenationLadderLimit:0><pLeftIndent:10.799999><cLanguage:English\: USA><pHyphenation:0><pHyphenateCapitals:0><pHyphenationZone:0.000000><pTabRuler:18\,Left\,.\,0\,\;31.5\,Left\,.\,0\,\;45\,Left\,.\,0\,\;58.5\,Left\,.\,0\,\;72\,Left\,.\,0\,\;85.5\,Left\,.\,0\,\;99\,Left\,.\,0\,\;112.5\,Left\,.\,0\,\;126\,Left\,.\,0\,\;139.5\,Left\,.\,0\,\;153\,Left\,.\,0\,\;166.5\,Left\,.\,0\,\;180\,Left\,.\,0\,\;193.5\,Left\,.\,0\,\;207\,Left\,.\,0\,\;220.5\,Left\,.\,0\,\;234\,Left\,.\,0\,\;><cFont:Courier New><pMaxLetterspace:0.050000><pMinLetterspace:-0.020000><pMaxGlyphScale:1.050000><pMinGlyphScale:0.950000><cHang:Baseline><pSingleWordAlignment:Left><pGridAlign:BaseLine>>
<DefineParaStyle:Feature Sub Section=<BasedOn:Feature Section><Nextstyle:Feature Sub Section><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:News URL=<BasedOn:NormalParagraphStyle><Nextstyle:News URL><cSize:9.500000><pSpaceAfter:4.500000><cFont:Minion \(T1\)><pRuleAboveGapColor:None><pRuleBelowGapColor:None><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pGridAlign:BaseLine><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:News para=<BasedOn:NormalParagraphStyle><Nextstyle:News para><cSize:9.500000><cFont:Minion \(T1\)><pRuleAboveGapColor:None><pRuleBelowGapColor:None><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pGridAlign:BaseLine><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:News Headline=<BasedOn:NormalParagraphStyle><Nextstyle:News Headline><cTypeface:Bold><cSize:9.500000><pSpaceBefore:4.500000><cFont:Gill Sans \(T1\)><pRuleAboveGapColor:None><pRuleBelowGapColor:None><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pGridAlign:BaseLine><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:Calendar URL=<Nextstyle:Calendar URL><cTypeface:Italic><cSize:10.000000><cLanguage:English\: USA><cFont:Minion \(T1\)><pRuleAboveGapColor:None><pRuleBelowGapColor:None><pTextAlignment:Center><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:Calendar title=<Nextstyle:Calendar title><cSize:10.000000><cLanguage:English\: USA><cFont:Minion \(T1\)><pRuleAboveGapColor:None><pRuleBelowGapColor:None><pTextAlignment:Center><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:Calendar location=<Nextstyle:Calendar location><cSize:10.000000><cLanguage:English\: USA><cFont:Minion \(T1\)><pRuleAboveGapColor:None><pRuleBelowGapColor:None><pTextAlignment:Center><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:Calendar date=<Nextstyle:Calendar date><cTypeface:Bold><cSize:11.000000><cCase:All Caps><cLanguage:English\: USA><cFont:Gill Sans \(T1\)><pRuleAboveGapColor:None><pRuleBelowGapColor:None><pTextAlignment:Center><cUnderlineGapColor:None><cStrikeThroughGapColor:None><pWarichuAlignment:Left><rUseOTProGlyph:1><cRubyEdgeSpace:1>>
<DefineParaStyle:Feature Title=<Nextstyle:Feature Title><cSize:26.500000><cLeading:13.500000><cFont:Rockwell Extra Bold><pTextAlignment:Center>>
<DefineParaStyle:Feature Byline=<BasedOn:NormalParagraphStyle><Nextstyle:Feature Byline><cTypeface:Italic><cSize:11.000000><cLeading:13.000000><cFont:Gill Sans \(TT\)><pTextAlignment:Right>>
<DefineParaStyle:Feature Deck=<BasedOn:Feature Byline><Nextstyle:Feature Deck><cTypeface:Regular><pSpaceBefore:4.500000><pTextAlignment:Center>>
<DefineParaStyle:Normal=<Nextstyle:Normal><KeyboardShortcut:Shift\+Cmd\+Num 6><cSize:11.000000><cLigatures:0><pHyphenationLadderLimit:0><cLeading:13.000000><cLanguage:English\: USA><pHyphenation:0><pHyphenationZone:0.000000><pSpaceBefore:4.500000><pSpaceAfter:4.500000><cFont:Arial \(TT\)><pMaxLetterspace:0.050000><pMinLetterspace:-0.020000><pMaxGlyphScale:1.050000><pMinGlyphScale:0.950000><cHang:Baseline><pSingleWordAlignment:Left><pTextAlignment:JustifyLeft>>
<DefineParaStyle:Body Copy=<BasedOn:Normal><Nextstyle:Body Copy><cSize:9.500000><pFirstLineIndent:12.024000><cLeading:-1.000000><pSpaceBefore:0.000000><pSpaceAfter:0.000000><cFont:Minion \(T1\)><pGridAlign:BaseLine><bulFont:\<TextFont\>><bulTypeFace:\<TextStyle\>>>
<DefineParaStyle:author byline=<BasedOn:Feature Para><Nextstyle:author byline><cTypeface:Italic><bulFont:\<TextFont\>><bulTypeFace:\<TextStyle\>>>
<DefineParaStyle:article head=<BasedOn:Normal><Nextstyle:Normal><KeyboardShortcut:Shift\+Cmd\+Num 1><cSize:14.000000><cHorizontalScale:1.100000><pSpaceBefore:13.500000><pSpaceAfter:0.000000><cFont:Arial Black><pKeepWithNext:4><cSkew:15.000000><pRuleBelowColor:Black><pRuleBelowTint:100.000000><pRuleBelowOffset:9.000000>>
<DefineParaStyle:article subhead=<BasedOn:article head><Nextstyle:article subhead><KeyboardShortcut:Shift\+Cmd\+Num 2><cSize:11.000000><pSpaceBefore:18.000000>>
HTML
	}

sub head1_style         { 'Feature Section' }
sub head2_style         { 'Feature Sub Section' }

sub normal_para_style   
	{
	# The paragraph style depends on which para it is. The very first para
	# has a drop cap. The first para after a section title has no initial
	# indent. All other paras have an initial indent.
	my $last_thing = $_[0]{last_thingy} || 'para';
	
	   if( $last_thing eq 'para' )  { 'Feature Para' } #indent
	elsif( $last_thing eq 'head1' ) { 'Feature Section Lead' } # no indent
	elsif( $last_thing eq 'start' ) { 'Feature Lead' }  # has drop cap
	else                            { 'Feature Para' }
	}
	
sub code_para_style     { 'Feature Code Para'   }

sub inline_code_style	{ 'pod-C' }

sub inline_url_style    { 'pod-I'  }

sub inline_italic_style { 'pod-I' }

sub inline_bold_style   { 'pod-B' }

sub start_Document
	{
	my $self = shift;
	
	$self->SUPER::start_Document;
	
	$self->{last_thingy} = 'start';
	}
	
sub start_head1 
	{
	my $self = shift;
	
	$self->SUPER::start_head1;
	
	$self->{scratch} .= '<cTypeface:Regular><cFont:Wingdings>n<cTypeface:><cFont:> ';
	}

sub end_head1 
	{
	my $self = shift;
	
	$self->{scratch} .= "\t"; # right tab to get ----- to right margin
	$self->{last_thingy} = 'head1';
	
	$self->SUPER::end_head1;
	}

sub start_Para
	{
	my $self = shift;
	
	$self->SUPER::start_Para;
	
	# psb must be after the start of the para. Go figure.
	$self->{scratch} .= '<pSpaceBefore:4.500000>' 
		if $self->{last_thingy} eq 'bullet_list';
	

	$self->{last_thingy} = 'para';
	}
	
sub new { $_[0]->SUPER::new() }

sub end_Verbatim 
	{	
	my @lines = split m/^/m, $_[0]{'scratch'};
	
	my $first = shift @lines;
	my $last  = shift @lines;	
	
	$_[0]{'scratch'} =~ s/\n+\z/\n/;
			
	my $style = $_[0]->code_para_style;
	
	# the pSpaceBefore comes after the <pstyle:> on the first line
	# so add it before I add the <pstyle:> to the front of every
	# line
	$_[0]{'scratch'} =~ s/^/<pSpaceBefore:4.500000>/;
	
	$_[0]{'scratch'} =~ s/^/<pstyle:$style>/gm;

	# after the first line, I need to reset <pSpaceBefore:>, so
	# find the position of the first newline and shove it in 
	# right after it. There's a special case where the code line
	# is a single line (so, no newline in scratch).
	my $first_newline_pos = index( $_[0]{'scratch'}, "\n" );
	
	if( $first_newline_pos == -1 )
		{
		$first_newline_pos = length( $_[0]{'scratch'} ) - 1;
		}
	
	#print STDERR "first_newline_pos is $first_newline_pos\n";
	#print STDERR "length of scratch is " . length( $_[0]{'scratch'} ) . "\n";
	
	substr( $_[0]{'scratch'}, $first_newline_pos + 1, 0 ) = '<pSpaceBefore:>';

	
	# right after the last <pstyle:> I need to specify the space after
	# that line. Heh, this might be the first time I've used rindex
	# for anything useful.
	my $substr_len = length "<pstyle:$style>";
	
	my $last_para_pos = rindex( $_[0]{'scratch'}, "<pstyle:$style>" );
	substr( $_[0]{'scratch'}, $last_para_pos + $substr_len, 0 ) 
		= '<pSpaceAfter:4.500000>';
	

	# the <pSpaceAfter:> really comes before the next normal para, but
	# I only need it after a verbatim block, so just attach it at the end
	# of this instead of the beginning of the next thing. Alternatively, 
	# I could look at last_thingy in normal_para_style, but that's a bit
	# more pain.
	$_[0]{'scratch'} .= "\n<pSpaceAfter:>";

	$_[0]->emit();

	$_[0]->{last_thingy} = 'verbatim';
	$_[0]{'in_verbatim'} = 0;
	}
	
sub _get_initial_item_type 
	{
	my $self = shift;
  
	my $type = $self->SUPER::_get_initial_item_type;
  
	#print STDERR "My item type is [$type]\n";
  
	$type;
	}

sub start_item_bullet 
	{
	my $self = shift;
	
	my $end_last = 
		$self->{bullet_count}++ ? 
			'<pLeftIndent:><pFirstLineIndent:><bnListType:>' 
			:
			'';
	
	$self->{'scratch'} .= <<"HERE";
<cLeading:5.400000>
<cLeading:>$end_last<ParaStyle:Feature Section Lead><pLeftIndent:10.000000><pFirstLineIndent:10.000000><bnListType:Bullet><cLeading:5.400000>
HERE

	chomp $self->{'scratch'};
	
	$self->emit;
	}

sub start_item_number { }
sub start_item_text   { }

sub start_over_bullet 
	{ 
	my $self = shift;
	
	$self->{in_bullet_list} = 1;
	$self->{bullet_count} = 0;
	}
sub start_over_text   { }
sub start_over_block  { }
sub start_over_number { }

sub end_over_bullet 
	{
	my $self = shift;
	
	$self->{'scratch'} .= "\n<pLeftIndent:><pFirstLineIndent:><bnListType:>"; 
	
	$self->end_non_code_text;
	
	$self->{in_bullet_list} = 0;	
	$self->{bullet_count}   = 0;
	$self->{last_thingy}    = 'bullet_list';
	}
	
sub end_over_text   { }
sub end_over_block  { }
sub end_over_number { }

sub end_item_bullet 
	{ 
	my $self = shift;

	$self->end_non_code_text;

	$self->{'scratch'} .= '<cLeading:>'; 
	
	$self->emit; 
	}
	
sub end_item_number { $_[0]->emit() }
sub end_item_text   { $_[0]->emit() }

=head1 TO DO

=over 4

=item * handle item lists

=back

=head1 SEE ALSO

L<Pod::InDesign::TaggedText>, L<Pod::Simple>

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	http://sourceforge.net/projects/brian-d-foy/

If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2007, brian d foy, All Rights Reserved.

You may redistribute this under the same terms as Perl itself.

=cut

1;
