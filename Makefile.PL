use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'debug',
    VERSION_FROM => 'lib/debug.pm', 
    PREREQ_PM    => {
        'Test::More' => 0.47,
    }
);
