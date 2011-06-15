#!/opt/local/bin/perl

eval 'exec /opt/local/bin/perl  -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;
use warnings;
use FindBin::libs;
use App::Starter;
use Getopt::Long;
use Pod::Usage;


GetOptions( \my %opt, 'name=s' );

App::Starter->new(
    {   name     => $opt{name},
        template => 'module',
        replace  => { module => $opt{name} }
    }
)->create;

1;
__END__

=head1 NAME

app-script.pl - App::Starter script file.

=head1 SYNOPSIS

 app-module-starter.pl --name MyModule

=head1 SEE ALSO

L<App::Starter>

=head1 AUTHOR

Tomohiro Teranishi

=cut

