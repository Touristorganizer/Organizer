#!/usr/bin/perl
=head1 Price

=cut

use strict;
use warnings;


BEGIN {
  our $libpath = '../';
  my $sql_type = 'mysql';
  unshift(@INC,
    $libpath . "Abills/$sql_type/",
    $libpath . "Abills/modules/",
    $libpath . '/lib/',
    $libpath . '/Abills/',
    $libpath,
    
  );
}

use Conf;
our (
  $libpath,
  %conf,
  %lang,
  $base_dir,
  $admin
);

do "../libexec/config.pl";

use Abills::HTML;
my $html = Abills::HTML->new(
  {
    IMG_PATH => 'img/',
    NO_PRINT => 1,
    CONF     => \%conf,
    CHARSET  => $conf{default_charset},
  }
);



use Abills::SQL;
my $db = Abills::SQL->connect($conf{dbtype}, $conf{dbhost}, $conf{dbname}, $conf{dbuser}, $conf{dbpasswd}, {
  CHARSET => ($conf{dbcharset}) ? $conf{dbcharset} : undef
});
use Abills::Base qw(_bp);
use Organizer::db::Organizer;
my $Organizer = Organizer::db::Organizer->new($db, $admin, \%conf);


if($html->{language} ne 'english') {
  do $libpath . "/language/english.pl";
}

if(-f $libpath . "/language/$html->{language}.pl") {
  do $libpath."/language/$html->{language}.pl";
}
require Abills::Templates;

Conf->new($db, undef, \%conf);
$html->{METATAGS} = templates('metatags_client');
print $html->header();

# print $html->tpl_show(_include('preloader', 'Organizer'));

my $section_list = $Organizer->get_section();
my $headers_id = '';

  foreach my $head (@$section_list) {
    $headers_id .= $html->tpl_show(_include('header_button', 'Organizer'), {
            HEADERS_ID     => $head->{id},
            BUTTON_NAME    => $head->{section_name},
            BUTTON_ICON    => $head->{section_icon},
            BUTTON_COLOR    => $head->{header_color},
              }, { OUTPUT2RETURN => 1 });
}

print $html->tpl_show(_include('header', 'Organizer'), {
    HEADER_BUTTONS => $headers_id,
  });


1;