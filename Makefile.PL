use strict;
use warnings;
use ExtUtils::MakeMaker;
use PDL::Core::Dev;

my @package = qw(OpenCV.pd OpenCV PDL::OpenCV);
my %descriptor = pdlpp_stdargs(\@package);

$descriptor{VERSION}   = 0.01;
$descriptor{OPTIMIZE}  = '-O3',
push @{$descriptor{LIBS}}, `pkg-config --libs opencv`;

WriteMakefile( %descriptor );

sub MY::postamble {
	pdlpp_postamble(\@package);
}

