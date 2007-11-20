use Test::LongString;

my $class = 'Pod::InDesign::TaggedText::TPR';
use_ok( $class );

my $input_dir = File::Spec->catfile( qw( t input_pod_dir ) );
ok( -d $input_dir, "Input directory is there" );


sub transform_file
	{
	my( $pod_file ) = shift;
	
	use File::Spec;
	
	my $parser = $class->new();
	isa_ok( $parser, $class );
	
	my $file = File::Spec->catfile( $input_dir, $pod_file );
	
	ok( -e $file, "Input file is there" );
	
	$parser->complain_stderr( 1 );
	$parser->output_string( \my $output );
	$parser->parse_file( $file );
	
	( my $output_reference = $file ) =~ s/.pod$/.txt/;
	
	ok( -e $output_reference, "Output reference file is there" );
	
	my $expected_output = do { local $/; local @ARGV = $output_reference; <> };
	
	is_string( $output, $expected_output );
	
	print STDERR "\n$output\n" if $ENV{DEBUG};
	}
	
1;