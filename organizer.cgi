#!/usr/bin/perl
=head1 

 Hello  world

=cut

use strict;
use warnings;

# Включение нужных путей
BEGIN {
  our $libpath = '../';
  my $sql_type = 'mysql';
  unshift(@INC,
    $libpath . "Abills/$sql_type/",
    $libpath . "Abills/modules/",
    $libpath . '/lib/',
    $libpath . '/Abills/',
    $libpath
  );
}

#Модуль конфигурации
use Conf;
our (
  $libpath,
  %conf,
  %lang,
  $base_dir,
);

# конфигурационный файл
do "../libexec/config.pl";

# HTML визуализация
use Abills::HTML;
my $html = Abills::HTML->new(
  {
    IMG_PATH => 'img/',
    NO_PRINT => 1,
    CONF     => \%conf,
    CHARSET  => $conf{default_charset},
  }
);

# Подключение базы
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




  my $section_list = $Organizer->get_section();
  my $section_item1 = '';
  my $section_item2 = '';
  my $cards   = '';
  # _bp('', $header_list);
  foreach my $head (@$section_list){
  
  
  my $information = $Organizer->get_info($head->{id});
    foreach my $info (@$information) {
      $cards .= $html->tpl_show(_include('TEMPLATE CARD', 'Organizer'), { 
    ITEM_NAME => $info->{item_name}, 
    PRICE => $info->{price}});   

    }
    $section_item1 .= $html->tpl_show(_include('TEMPLATE SECTION LEFT', 'Organizer'), {
      HEADER_NAME1 => $head->{header_name}, 
      PROPERTIES   => $cards,
      ID           => $head->{id}}, { OUTPUT2RETURN => 1 });
    $cards ='';
    # $section_item2 .= $html->tpl_show(_include('TEMPLATE SECTION RIGHT', 'Organizer'), {
    #   HEADER_NAME2 => $head->{header_name},
    #   ID           => $head->{id}}, { OUTPUT2RETURN => 1 });
  # _bp('', $items);
  # my $user_line = '';
}
  print $html->tpl_show(_include('TEMPLATE SECOND PAGE', 'Organizer'), { 
    HEADER_PANEL_LEFT => $section_item1, 
    # HEADER_PANEL_RIGHT => $section_item2,
    });
  




1;
