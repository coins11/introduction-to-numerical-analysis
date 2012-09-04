use strict;
use warnings;
use Data::Dumper;

my $length = shift @ARGV;

open my $fh, '<', '../tmpl/head.tex' or die "tmpl/head.tex is NOT exist!\n";
my @lines = <$fh>;
close $fh;

open $fh, '<', '../tmpl/section.tex' or die "tmpl/section.tex is NOT exist!\n";
my $section = '';
$section .= $_ while <$fh>;
close $fh;

print Dumper @ARGV;

for my $num (1..$length) {
	my $result = '';
	if ($ARGV[$num - 1]) {
		open $fh, '<', $ARGV[$num - 1];
		$result  = "\\begin{lstlisting}\n";
		<$fh> for 1..13;
		$result .= $_ while <$fh>;
		$result .= "\\end{lstlisting}\n";
		close $fh;
	}

	print $_;

	my $newsec  = $section;
	$newsec =~ s/---FILENAME---/.\/src\/$num.m/g;
	$newsec =~ s/---RESULT---/$result/;

	push @lines, $newsec;
}

open $fh, '<', '../tmpl/end.tex' or die "tmpl/end.tex is NOT exist!\n";
push @lines, $_ while <$fh>;
close $fh;

open $fh, '>', 'out.tex';
print $fh $_ for @lines;
close $fh;
