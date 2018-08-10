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
				$libpath."Abills/$sql_type/",
				$libpath."Abills/modules/",
				$libpath.'/lib/',
				$libpath.'/Abills/',
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
		$admin
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
}
require Abills::Templates;

Conf->new($db, undef, \%conf);
$html->{METATAGS} = templates('metatags_client');
print $html->header();

my $section_list = $Organizer->get_section();
my $section_item2 = '';

my $carts = '';
my $items = '';

foreach my $head (@$section_list) {
		my $information = $Organizer->get_info($head->{id});
		foreach my $info (@$information) {
				$items .= $html->tpl_show(_include('item', 'Organizer'), {
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
        						START_DATE   => $info->{start_date},
        						FINISH_DATE  => $info->{finish_date}
						});
		}
		$carts .= $html->tpl_show(_include('cart', 'Organizer'), {
						SECTION_ID      => 'cart-'.$head->{id},
						SECTION_NAME    => $head->{section_name},
						SECTION_ICON    => $head->{section_icon},
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

1;
