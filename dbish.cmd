extproc perl -Sw
#!i:/perllib/bin/perl5.7.3 -w

use strict;

use DBI::Shell;
shell(@ARGV);
exit(0);

__END__

=head1 NAME

dbish	- Interactive command shell for the Perl DBI

=head1 SYNOPSIS

  dbish <options> dsn [user [password]]

=head1 DESCRIPTION

This tool is a command wrapper for the DBI::Shell perl module.
See L<DBI::Shell(3)> for full details.

=head1 SEE ALSO

L<DBI::Shell(3)>, L<DBI(3)>

=cut
