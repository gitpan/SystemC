# vrename Makefile.PL

use ExtUtils::MakeMaker;
use Carp;

sub MY::postamble {
"
README: readme.texi
	-rm \$@
	makeinfo \$< --output \$@ --no-headers --no-validate

maintainer-clean: distclean
	-rm README Makefile

dist: distcheck README

install-local: manifypods
	cp -R blib/man* /usr/local/common/man

tag:
	cvs tag -F V\$(VERSION_SYM) .
";
}

WriteMakefile(
	      DISTNAME  => 'SystemC',
	      NAME      => 'SystemC',
	      AUTHOR	=> 'Wilson Snyder <wsnyder@wsnyder.org>',
	      ABSTRACT  => 'SystemC Netlist Utilities and Parsing',
	      VERSION_FROM  => 'Netlist.pm',
	      EXE_FILES => [qw( sp_preproc )],
	      'clean'	=> {FILES => qw ( ),},
	      'dist'    => {COMPRESS => 'gzip -9f',
			    SUFFIX   => '.gz', 
			    DIST_DEFAULT => 'README all tardist',
			},
	      );

