use strict;
use warnings;
use ExtUtils::MakeMaker;
use PDL::Core::Dev;

my @package = qw(OpenCV.pd OpenCV PDL::OpenCV);
my %descriptor = pdlpp_stdargs(\@package);

$descriptor{VERSION}   = 0.01;
#$descriptor{OPTIMIZE}  = '-g',
$descriptor{OPTIMIZE}  = '-O3 -mtune=core2',
push @{$descriptor{LIBS}}, '-L/usr/lib/atlas -llapack -lblas -latlas -lcv';

WriteMakefile( %descriptor );

sub MY::postamble {
	pdlpp_postamble(\@package);
}

