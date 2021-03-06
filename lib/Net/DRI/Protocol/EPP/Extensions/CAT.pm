## Domain Registry Interface, .CAT EPP extensions
##
## Copyright (c) 2006,2008,2009 Patrick Mevzek <netdri@dotandco.com>. All rights reserved.
##
## This file is part of Net::DRI
##
## Net::DRI is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## See the LICENSE file that comes with this distribution for more details.
#
# 
#
####################################################################################################

package Net::DRI::Protocol::EPP::Extensions::CAT;

use strict;
use warnings;

use base qw/Net::DRI::Protocol::EPP/;

our $VERSION=do { my @r=(q$Revision: 1.3 $=~/\d+/g); sprintf("%d".".%02d" x $#r, @r); };

=pod

=head1 NAME

Net::DRI::Protocol::EPP::Extensions::CAT - .CAT EPP extensions for Net::DRI

=head1 DESCRIPTION

Please see the README file for details.

=head1 SUPPORT

For now, support questions should be sent to:

E<lt>netdri@dotandco.comE<gt>

Please also see the SUPPORT file in the distribution.

=head1 SEE ALSO

E<lt>http://www.dotandco.com/services/software/Net-DRI/E<gt>

=head1 AUTHOR

Patrick Mevzek, E<lt>netdri@dotandco.comE<gt>

=head1 COPYRIGHT

Copyright (c) 2006,2008,2009 Patrick Mevzek <netdri@dotandco.com>.
All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

See the LICENSE file that comes with this distribution for more details.

=cut

####################################################################################################

sub setup
{
 my ($self,$rp)=@_;
 $self->ns({ puntcat_contact => ['http://xmlns.domini.cat/epp/contact-ext-1.0','puntcat-contact-ext-1.0.xsd'],
             puntcat_domain  => ['http://xmlns.domini.cat/epp/domain-ext-1.0','puntcat-domain-ext-1.0.xsd'],
             puntcat_defreg  => ['http://xmlns.domini.cat/epp/defreg-1.0','puntcat-defreg-1.0.xsd'],
          });
 $self->capabilities('host_update','name',undef);
 $self->capabilities('domain_update','name_variant',['add','del']);
 $self->capabilities('domain_update','lang',['set']);
 $self->capabilities('domain_update','maintainer',['set']);
 $self->capabilities('domain_update','intended_use',['set']);
 foreach my $o (qw/status contact/) { $self->capabilities('defreg_update',$o,['add','del']); }
 foreach my $o (qw/registrant auth maintainer trademark/) { $self->capabilities('defreg_update',$o,['set']); }
 return;
}

sub default_extensions { return qw/CAT::Domain CAT::Contact CAT::DefensiveRegistration/; }

####################################################################################################
1;
