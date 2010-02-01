package Hailo::Tokenizer::Characters;
use 5.10.0;
use Moose;
use MooseX::Method::Signatures;
use MooseX::StrictConstructor;
use List::MoreUtils qw<uniq>;
use Text::Trim;
use namespace::clean -except => 'meta';

our $VERSION = '0.01';

# output -> tokens
sub make_tokens {
    my ($self, $line) = @_;
    return split //, $line;
}

# return a list of key tokens
sub find_key_tokens {
    my ($self, $tokens) = @_;
    return uniq(@$tokens);
}

# tokens -> output
sub make_output {
    my ($self, $reply) = @_;
    return trim join '', @$reply;
}

with qw(Hailo::Role::Generic
        Hailo::Role::Tokenizer);

__PACKAGE__->meta->make_immutable;

=encoding utf8

=head1 NAME

Hailo::Tokenizer::Characters - A character tokenizer for L<Hailo|Hailo>

=head1 DESCRIPTION

This tokenizer dumbly splits input with C<split //>. Use it to
generate chains on a per-character basis.

=head1 AUTHOR

E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason <avar@cpan.org>

=head1 LICENSE AND COPYRIGHT

Copyright 2010 E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason.

This program is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
