extproc perl -S 
#!f:/perllib/bin/perl
    eval 'exec f:/perllib/bin/perl -S $0 ${1+"$@"}'
	if $running_under_some_shell;

use Pod::Text;

if(@ARGV) {
	pod2text($ARGV[0]);
} else {
	pod2text("<&STDIN");
}

