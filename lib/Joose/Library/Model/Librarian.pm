package Joose::Library::Model::Librarian;

use strict;
use warnings;
use parent 'Catalyst::Model::Adaptor';

use Joose::Librarian;

__PACKAGE__->config(
    class => 'Joose::Librarian' 
);


sub prepare_arguments {
	my ($self, $app) = @_; # $app sometimes written as $c
	
	my $app_conf = $app->config->{'Model::Librarian'};
	
    $ENV{JOOSE_LIB} = $app_conf->{library};
    $ENV{JOOSE_BUNDLE} = $app_conf->{bundles};
    
    $ENV{JOOSE_INC} = join(";", ($ENV{JOOSE_INC}, @{$app_conf->{roots}}));
    
	return {};
}


=head1 NAME

Joose::Library::Model::Librarian - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

SamuraiJack

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
