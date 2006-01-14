package Data::RoundRobin;
use strict;
use warnings;
our $VERSION = '0.01';

sub new {
    my ($class, @arr) = @_;
    my $self = {
        array => \@arr,
        current => 0,
        total => scalar(@arr),
    };
    return bless $self;
}

sub next {
    my $self = shift;
    my $r    = $self->{array}->[$self->{current}];
    $self->{current}++;
    $self->{current} %= $self->{total};
    return $r;
}

1;

__END__

=head1 NAME

  Data::RoundRobin - Serve data in a round robin manner.

=head1 SYNOPSIS

  my @array = qw(a b);
  # OO Interface
  my $rr = Data::RoundRobin->new(@array);

  print $rr->next; # a
  print $rr->next; # b
  print $rr->next; # a
  print $rr->next; # b
  ...

  # Infinite Loop
  while(my $elem = $rr->next) {
     ...
  }

=head1 DESCRIPTION

This module provides a round roubin object implementation.  It is similar to
an iterator, only the internal counter is reset to the begining whenever it
reaches the end. It might also be considered as a circular iterator.

=head1 METHODS

=over 4

=item new

Constructor, a list should be given to construct a C<Data::RoundRobin> object.

=item next

Retrieve next value of this instance.

=back

=head1 COPYRIGHT

Copyright 2006 by Kang-min Liu <gugod@gugod.org>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

See <http://www.perl.com/perl/misc/Artistic.html>

=cut

