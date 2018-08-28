#!/usr/bin/perl
=head1 

 Hello  world

=cut

use strict;
use warnings;

BEGIN {
		our $libpath = '../';
		my $sql_type = 'mysql';
		unshift(@INC,
				$libpath."Abills/$sql_type/",
				$libpath."Abills/modules/",
				$libpath.'/lib/',
				$libpath.'/Abills/',
				$libpath
		);
}


use Conf;
our (
		$libpath,
		%conf,
		%lang,
		$base_dir,
		$admin,
		$DATE
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
use Abills::Base;
my $db = Abills::SQL->connect($conf{dbtype}, $conf{dbhost}, $conf{dbname}, $conf{dbuser}, $conf{dbpasswd}, {
				CHARSET => ($conf{dbcharset}) ? $conf{dbcharset} : undef
		});
use Abills::Base qw(_bp);
use Organizer::db::Organizer;
my $Organizer = Organizer::db::Organizer->new($db, $admin, \%conf);

if ($html->{language} ne 'english') {
		do $libpath."/language/english.pl";
}
if (-f $libpath."/language/$html->{language}.pl") {
		do $libpath."/language/$html->{language}.pl";
		do $libpath."/Abills/modules/Organizer/lng_$html->{language}.pl";
}
require Abills::Templates;

Conf->new($db, undef, \%conf);
$html->{METATAGS} = templates('metatags_client');
print $html->header();
if($FORM{offer_info}) {
	offer_new_info();
    exit;
}

my $section_list = $Organizer->get_section();
my $section_item2 = '';

my $carts = '';
my $items = '';

foreach my $head (@$section_list) {
		my $information = $Organizer->get_info($head->{id});
		foreach my $info (@$information) {
			if ($info->{confirmation} ==1) {
				if ($info->{start_date} eq '' || $info->{start_date} eq '0000-00-00') {
						$items .= $html->tpl_show(_include('item2', 'Organizer'), {
										PARENTID     => 'cart-'.$head->{id},
										ID           => 'list-'.$info->{id},
										AVR_TIME     => $info->{avr_time},
										IMAGE        => $info->{image},
										SERVICE_NAME => $info->{service_name},
										DESCRIPTION  => $info->{description},
										ADDRESS      => $info->{address},
										TIME_START   => $info->{time_start},
										TIME_FINISH  => $info->{time_finish},
										LNG          => $info->{lng},
										LAT          => $info->{lat},
										# START_DATE   => $info->{start_date},
										# FINISH_DATE  => $info->{finish_date}
								});
				}
				else {
					if ($info->{finish_date} ge $DATE) {
						$items .= $html->tpl_show(_include('item1', 'Organizer'), {
										PARENTID     => 'cart-'.$head->{id},
										ID           => 'list-'.$info->{id},
										AVR_TIME     => $info->{avr_time},
										IMAGE        => $info->{image},
										SERVICE_NAME => $info->{service_name},
										DESCRIPTION  => $info->{description},
										ADDRESS      => $info->{address},
										TIME_START   => $info->{time_start},
										TIME_FINISH  => $info->{time_finish},
										START_DATE   => $info->{start_date},
										FINISH_DATE  => $info->{finish_date},
										LNG          => $info->{lng},
										LAT          => $info->{lat},
								});
						# print $DATE;
						# _bp('', $info->{finish_date});
					}
					}
				}
				}
		
		$carts .= $html->tpl_show(_include('cart', 'Organizer'), {
						SECTION_ID      => 'cart-'.$head->{id},
						SECTION_NAME    => $head->{section_name},
						SECTION_ICON    => $head->{section_icon},
						HEADER_COLOR    => $head->{header_color},
						SECTION_CONTENT => $items
				}, { OUTPUT2RETURN => 1 });
		$items = '';
		#     $section_item2 .= $html->tpl_show(_include('TEMPLATE SECTION RIGHT', 'Organizer'), {
		#       HEADER_NAME2 => $head->{header_name},
		#       ID           => $head->{id}}, { OUTPUT2RETURN => 1 });
		# _bp('', $items);
		# my $user_line = '';
}

#  print $carts;

print $html->tpl_show(_include('main', 'Organizer'), {
				CONTENT => $carts,
		});


#**********************************************************
=head2 service_price_add() - Add headers and items to DB 

  Arguments:
     
  Returns:
    true
=cut
#**********************************************************
sub offer_new_info {
  my $show_template = $FORM{offer_info_form} || 0;
  $Organizer->{ACTION}     = 'add';
  $Organizer->{LNG_ACTION} = $lang{ADD};

  if ($FORM{add}) {
    $Organizer->service_add({%FORM});
    if (!$Organizer->{errno}) {
      print $html->message('info', $lang{INFO}, $lang{ADDED});
    }
  }

    my $service_select = $html->form_select(
    'SECTION_ID',
    {
      SELECTED => $FORM{SECTION_ID} || q{},
      SEL_LIST  => $Organizer->get_section({ COLS_NAME => 1 }),
      SEL_KEY   => 'id',
      SEL_VALUE => 'section_name'
    }
  );
    $Organizer->{OFFER_INFO} = 1;
   print $html->tpl_show(_include('offer_info_add', 'Organizer'), { 
    SERVICE_SELECT => $service_select, %$Organizer});
  
      # print $html->tpl_show(_include('offer_new_info', 'Organizer'), $Organizer); 
  
}
1;
