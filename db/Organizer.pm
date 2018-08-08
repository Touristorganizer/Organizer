package Organizer::db::Organizer;

use strict;
use parent qw(dbcore);
use Abills::Base qw(_bp);
#**********************************************************
=head2 new($db, $admin, \%conf) - Constructor for Treeview
  Returns:
    $self
=cut
#**********************************************************
sub new {
  my ($class, $db, $admin, $CONF) = @_;
  my $self = {
    db    => $db,
    admin => $admin,
    conf  => $CONF
  };
  bless($self, $class);
  return $self;
}
#**********************************************************
=head2 get_info($attr) - service status info

  Arguments:
    $attr
      ID

  Returns:
    $self

=cut
#**********************************************************
sub get_info {
  my $self = shift;
  my ($attr) = @_;
  $self->query( "SELECT * FROM organizer_info WHERE section_id = $attr;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 section_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub section_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('organizer_section', $attr);
  return $self;

}
#**********************************************************
=head2 info_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub info_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('organizer_info', $attr);
  return $self;
}
#**********************************************************
=head2 get_section() - Get info about header from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_section {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,section_name FROM organizer_section;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
1;