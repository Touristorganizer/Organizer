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
=head2 get_info($attr) - get section info for cards

  Arguments:
   
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_info {
  my $self = shift;
  my ($attr) = @_;
  $self->query( "SELECT id,service_name,description,address,avr_time,image,DATE_FORMAT(`time_start`, '%H:%i') AS time_start,DATE_FORMAT(`time_finish`, '%H:%i') AS time_finish,
  lat,lng,start_date,finish_date FROM organizer_info WHERE section_id = $attr;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 section_add() - Add section info into DB

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
sub service_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('organizer_info', $attr);
  return $self;
}
#**********************************************************
=head2 get_section() - Get info about section from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_section {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,section_name,section_icon FROM organizer_section;", 
    undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 info_section() - Get info about section from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub info_section {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,section_name,section_icon FROM organizer_section;", 
    undef, { INFO => 1 });
  return $self;
}
#**************************************************************
=head2 section_change()  -Change section info

=cut
#**************************************************************
sub section_change {
  my $self = shift;
  my ($attr) = @_;
  $self->changes(
    {
      CHANGE_PARAM => 'ID',
      TABLE        => 'organizer_section',
      DATA         => $attr
    }
  );
  return $self;
}
#**************************************************************
=head2 section_del()  -Delete section from DB

=cut
#**************************************************************
sub section_del {
  my $self = shift;
  my ($id) = @_;
  $self->query_del('organizer_section', { ID => $id });
  return $self;
}
#**********************************************************
=head2 get_section() - Get info about section from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_service {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,service_name,description,address,avr_time,image,time_start,time_finish,
  lat,lng,start_date,finish_date FROM organizer_info;", 
    undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 service_info() - Get info about services from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub service_info {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,service_name,description,address,avr_time,image,time_start,time_finish,
  lat,lng,start_date,finish_date FROM organizer_info WHERE id=$attr;", 
    undef, { INFO => 1 });
  return $self;
}
#**************************************************************
=head2 section_change()  -Change section info

=cut
#**************************************************************
sub service_change {
  my $self = shift;
  my ($attr) = @_;
  $self->changes(
    {
      CHANGE_PARAM => 'ID',
      TABLE        => 'organizer_info',
      DATA         => $attr
    }
  );
  return $self;
}
#**************************************************************
=head2 section_del()  -Delete section from DB

=cut
#**************************************************************
sub service_del {
  my $self = shift;
  my ($id) = @_;
  $self->query_del('organizer_info', { ID => $id });
  return $self;
}

1;