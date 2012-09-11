use strict;
use warnings;

my @pwd = split '/', `pwd`;
my $pwd = pop @pwd;
chomp $pwd;

my $length = shift @ARGV;

my @mfile;
push @mfile, (shift @ARGV) for 0..$length-1;

my @out;
push @out, (shift @ARGV) for 0..$length-1;

my @article;
push @article, (shift @ARGV) for 0..$length-1;

# open my $fh, '<', '../../tmpl/head.tex' or die "tmpl/head.tex is NOT exist!\n";
# my @lines = <$fh>;
# close $fh;

open my $fh, '<', '../../tmpl/section.tex' or die "tmpl/section.tex is NOT exist!\n";
my $section = '';
$section .= $_ while <$fh>;
close $fh;

my @lines;
for (0..$length-1) {
	my $newsec  = $section;
	
	$newsec =~ s/---MFILE---/\\lstinputlisting[style=matlab]{$pwd\/$mfile[$_]}/g;

	my $result = '';
	if ($out[$_]) {
		$result = "\\lstinputlisting{$pwd/$out[$_]}";
	}
	$newsec =~ s/---RESULTFILE---/$result/g;

	my $input = '';
	if ($article[$_]) {
		$input = "\\input{$pwd/$article[$_]}\n";
	}
	$newsec =~ s/---ARTICLEFILE---/$input/g;

	push @lines, $newsec;
}

# open $fh, '<', '../../tmpl/end.tex' or die "tmpl/end.tex is NOT exist!\n";
# push @lines, $_ while <$fh>;
# close $fh;

open $fh, '>', 'out.tex';
print $fh $_ for @lines;
close $fh;
