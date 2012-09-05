use strict;
use warnings;
use Data::Dumper;

my $length = shift @ARGV;

my @mfile;
push @mfile, (shift @ARGV) for 0..$length-1;

my @out;
push @out, (shift @ARGV) for 0..$length-1;

my @article;
push @article, (shift @ARGV) for 0..$length-1;

open my $fh, '<', '../tmpl/head.tex' or die "tmpl/head.tex is NOT exist!\n";
my @lines = <$fh>;
close $fh;

open $fh, '<', '../tmpl/section.tex' or die "tmpl/section.tex is NOT exist!\n";
my $section = '';
$section .= $_ while <$fh>;
close $fh;

print Dumper @ARGV;

for (0..$length-1) {
	my $newsec  = $section;
	
	$newsec =~ s/---MFILE---/$mfile[$_]/g;

	my $result = '';
	if ($out[$_]) {
		$result = "\\lstinputlisting{$out[$_]}";
	}
	$newsec =~ s/---RESULTFILE---/$result/g;

	my $input = '';
	if ($article[$_]) {
		$input = "\\input{$article[$_]}\n";
	}
	$newsec =~ s/---ARTICLEFILE---/$input/g;

	push @lines, $newsec;
}

open $fh, '<', '../tmpl/end.tex' or die "tmpl/end.tex is NOT exist!\n";
push @lines, $_ while <$fh>;
close $fh;

open $fh, '>', 'out.tex';
print $fh $_ for @lines;
close $fh;
