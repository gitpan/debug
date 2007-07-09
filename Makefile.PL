use ExtUtils::MakeMaker;

my $version = '0.04';
my $name    = 'debug';
my $fname   = "debug-$version";
my $prereqs = {
    'Test::More' => 0.47,
};

sub MY::postamble { "

deb:
	(head -1 debian/changelog | grep $version) || exit 1
	rm -f $fname.tar.gz
	-chmod 755 debian/rules
	\$(MAKE) dist
	tar zxvf $fname.tar.gz
	cd $fname && dpkg-buildpackage -b -rfakeroot -tc

";
}

WriteMakefile(
    NAME         => $name,
    VERSION_FROM => 'lib/debug.pm', 
    PREREQ_PM    => $prereqs,
);
