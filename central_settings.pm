#!/usr/bin/perl

# EliteDealSeeker-Core
# Central Settings: list of categories, sites and respective routines
#
# Copyright (C) 2010 Andrew Lamoureux
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

use common_parser;
use common_sites;

use warnings;
use strict;

package central_settings;

require Exporter;
our @ISA = ("Exporter");

our $token_regex = '^[\w\d\-\&\/ \.]+$';
our $not_token_regex = '[^\w\d\-\&\/ \.]+';
our $legal_search_characters_regex = '^[\(\)\w\d\-\+\,\ \"\&\/\.]+$';
our $search_string_length_limit = 32;
our $search_string_word_num_limit = 8;
our $max_age_lookback = 64;
our $contact_email = 'andrew142857@elitedealseeker.com';
our $contact_email_string = 'andrew142857 [@] elitedealseeker [.] com';

our %categories =
	(	
#			'allforums' => '(all forums)',
			'watches' => 'watch forums',
			'paintball' => 'paintball forums',
			'gunstuff' => 'firearm forums',
			'misc' => 'miscellaneous forums',
			'florida' => 'Florida craigslist cities',
			'aquaria' => 'aquarium sites',
			'motors' => 'car & motorcycle forums',
			'computers' => 'computers and accessories'
			
	);

our @sites_info =
(
{
	'sitename' => 'miami.craigslist.org/mdc',
	'urls' => [	'http://miami.craigslist.org/mdc/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://miami.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
        'sitename' => 'miami.craigslist.org/brw',
        'urls' => [     'http://miami.craigslist.org/brw/sss/'      ],
        'category' => 'florida',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('craigslist', $html, 'http://miami.craigslist.org');
        },
        'active' => 1,
        'cookie' => ''
},
{
        'sitename' => 'miami.craigslist.org/pbc',
        'urls' => [     'http://miami.craigslist.org/pbc/sss/'      ],
        'category' => 'florida',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('craigslist', $html, 'http://miami.craigslist.org');
        },
        'active' => 1,
        'cookie' => ''
},
{
	'sitename' => 'daytona.craigslist.org/',
	'urls' => [	'http://daytona.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://daytona.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
    'sitename' => 'keys.craigslist.org',
    'urls' => [	'http://keys.craigslist.org/sss/'	],
    'category' => 'florida',
    'parser' => sub
    {
        my ($html) = @_;
        return common_parser::parse('craigslist', $html, 'http://keys.craigslist.org');
    },
    'active' => 1,
    'cookie' => ''
},
{
	'sitename' => 'fortmyers.craigslist.org',
	'urls' => [	'http://fortmyers.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://fortmyers.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'gainesville.craigslist.org',
	'urls' => [	'http://gainesville.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://gainesville.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'jacksonville.craigslist.org',
	'urls' => [	'http://jacksonville.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://jacksonville.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'lakeland.craigslist.org',
	'urls' => [	'http://lakeland.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://lakeland.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'ocala.craigslist.org',
	'urls' => [	'http://ocala.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://ocala.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'orlando.craigslist.org',
	'urls' => [	'http://orlando.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://orlando.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'pensacola.craigslist.org',
	'urls' => [	'http://pensacola.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://pensacola.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'sarasota.craigslist.org',
	'urls' => [	'http://sarasota.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://sarasota.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'spacecoast.craigslist.org',
	'urls' => [	'http://spacecoast.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://spacecoast.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'tallahassee.craigslist.org',
	'urls' => [	'http://tallahassee.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://tallahassee.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'tampa.craigslist.org/hdo',
	'urls' => [	'http://tampa.craigslist.org/hdo/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://tampa.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'tampa.craigslist.org/hil',
	'urls' => [	'http://tampa.craigslist.org/hil/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://tampa.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'tampa.craigslist.org/psc',
	'urls' => [	'http://tampa.craigslist.org/psc/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://tampa.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'tampa.craigslist.org/pnl',
	'urls' => [	'http://tampa.craigslist.org/pnl/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://tampa.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},
{
	'sitename' => 'treasure.craigslist.org',
	'urls' => [	'http://treasure.craigslist.org/sss/'	],
        'category' => 'florida',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('craigslist', $html, 'http://treasure.craigslist.org');
	},
	'active' => 1,
	'cookie' => ''
},

#
# Car / Motorcycle Forums
#

{
        'sitename' => 'r3vlimited.com',
        'category' => 'motors',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p7p3', $html, 'http://r3vlimited.com/board/');
        },
        'active' => 1,
        'urls' => [     'http://r3vlimited.com/board/forumdisplay.php?f=103',
			'http://r3vlimited.com/board/forumdisplay.php?f=147',
			'http://r3vlimited.com/board/forumdisplay.php?f=142' ],
        'cookie' => ''
},
{
        'sitename' => 'e46fanatics.com',
        'category' => 'motors',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p7p3', $html, 'http://forum.e46fanatics.com/');
        },
        'active' => 1,
        'urls' => [     'http://forum.e46fanatics.com/forumdisplay.php?f=33',
			'http://forum.e46fanatics.com/forumdisplay.php?f=31',
			'http://forum.e46fanatics.com/forumdisplay.php?f=34',
			'http://forum.e46fanatics.com/forumdisplay.php?f=36',
			'http://forum.e46fanatics.com/forumdisplay.php?f=70',
			'http://forum.e46fanatics.com/forumdisplay.php?f=76',
			'http://forum.e46fanatics.com/forumdisplay.php?f=32',
			'http://forum.e46fanatics.com/forumdisplay.php?f=35',
			'http://forum.e46fanatics.com/forumdisplay.php?f=37'	],
        'cookie' => ''
},
{
        'sitename' => 'caraudio.com',
        'category' => 'motors',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8', $html, 'http://www.caraudio.com/forum/');
        },
        'active' => 1,
        'urls' => [     'http://www.caraudio.com/forum/forumdisplay.php?f=6'	],
        'cookie' => ''
},
{
        'sitename' => 'ih8mud.com',
        'category' => 'motors',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8_b', $html, 'http://forum.ih8mud.com')
        },
        'active' => 1,
        'urls' => [     'http://forum.ih8mud.com/sale-parts/',
			'http://forum.ih8mud.com/tires-wheels/',
			'http://forum.ih8mud.com/parting-out/',
			'http://forum.ih8mud.com/diesel-jdm-parts/',
			'http://forum.ih8mud.com/vehicles-trailers-sale-wanted/'    ],
        'cookie' => ''
},
{
        'sitename' => 'corvetteforum.com',
        'category' => 'motors',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8_b', $html, '')
        },
        'active' => 1,
        'urls' => [     'http://forums.corvetteforum.com/c6-corvettes-for-sale-98/',
			'http://forums.corvetteforum.com/c6-parts-for-sale-wanted-115/',
			'http://forums.corvetteforum.com/c5-corvettes-for-sale-52/',
			'http://forums.corvetteforum.com/c5-parts-for-sale-wanted-53/',
			'http://forums.corvetteforum.com/c4s-for-sale-wanted-54/',
			'http://forums.corvetteforum.com/c4-parts-for-sale-wanted-55/',
			'http://forums.corvetteforum.com/c3s-for-sale-wanted-56/',
			'http://forums.corvetteforum.com/c3-parts-for-sale-wanted-57/',
			'http://forums.corvetteforum.com/c1s-and-c2s-for-sale-wanted-58/',
			'http://forums.corvetteforum.com/c1-and-c2-parts-59/'
		],
        'cookie' => ''
},


#
# Watch Forums
#
{
	'sitename' => 'Asian Watch Forum',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('network54', $html, 'http://www.network54.com/Forum/642234/');
	},
	'active' => 1,
	'urls' => [     'http://www.network54.com/Forum/642234/'  ],
	'cookie' => ''
},
{
	'sitename' => 'orientalwatchsite.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('ipb3p0p3', $html, 'http://www.orientalwatchsite.com/forum/');
	},
	'active' => 1,
	'urls' => [	'http://www.orientalwatchsite.com/forum/index.php?/forum/10-watches-for-sale/'	],
	'cookie' => ''
},
{
	'sitename' => 'rolexforums.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('vbulletin3p8p0', $html, 'http://rolexforums.com/');
	},
	'active' => 1,
	'urls' => [	'http://rolexforums.com/forumdisplay.php?f=9&drgn=1'	],
	'cookie' => 'cDRGN=891958777'
},
{
	'sitename' => 'Vintage Rolex Market',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('network54', $html, 'http://www.network54.com/Forum/207673/');
	},
	'active' => 1,
	'urls' => [	'http://www.network54.com/Forum/207673/'	],
	'cookie' => ''
},
{
	'sitename' => 'OSWF',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('network54', $html, 'http://www.network54.com/Forum/566835/');
	},
	'active' => 1,
	'urls' => [	'http://www.network54.com/Forum/566835/'	],
	'cookie' => ''
},
{
	'sitename' => 'www.bdwf.net',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('vbulletin3p7p3', $html, 'http://www.bdwf.net/forum/');
	},
	'active' => 1,
	'urls' => [	'http://87.106.245.70/forum/forumdisplay.php?f=83'	],
	'cookie' => ''
},
{
	'sitename' => 'www.thewatchforum.co.uk',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('ipboard_2p3p1', $html, 'http://www.thewatchforum.co.uk/');
	},
	'active' => 1,
	'urls' => [	'http://www.thewatchforum.co.uk/index.php?showforum=6',
			'http://www.thewatchforum.co.uk/index.php?showforum=11'	],
	'cookie' => ''
},
{
	'sitename' => 'http://www.mwrforum.net Post Exchange',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('vbulletin3p6p5', $html, 'http://www.mwrforum.net/forums/');
	},
	'active' => 1,
	'urls' => [	'http://www.mwrforum.net/forums/forumdisplay.php?f=22',	],
	'cookie' => ''
},
{
	'sitename' => 'www.timetechtalk.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('ultrabb1p17', $html, 'http://www.timetechtalk.com/');
	},
	'active' => 1,
	'urls' => [	'http://www.timetechtalk.com/view_forum.php?id=8'	],
	'cookie' => ''
},
{
	'sitename' => 'www.pmwf.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		my @links;
	
		while($html =~ m/<a name="msg-\d+" href="([^ ]*)" class="" title="">([^<]*)<\/a>/gi) {
			push(@links, [$1, $2]);
		}

		return @links;
	},
	'active' => 1,
	'urls' => [	'http://www.pmwf.com/Phorum/list.php?10,tzo=-4',
			'http://www.pmwf.com/Phorum/list.php?16,tzo=-4',
			'http://www.pmwf.com/Phorum/list.php?50'	],
	'cookie' => ''
},
{
	'sitename' => 'SEIKO & CITIZEN WATCH FORUM (www.thewatchsite.com)',
	'category' => 'watches',
	'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('smf_2p0rc2', $html, 'http://www.thewatchsite.com');
        },
	'active' => 1,
	'urls' => ['http://www.thewatchsite.com/index.php/board,11.0.html',
			'http://www.thewatchsite.com/index.php/board,13.0.html'],
	'cookie' => ''
},
{
	'sitename' => 'www.timezone.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
		my @links;                                

		while($html =~ m/<a class="mA".*?href="(.*?)">(.*?)<\/a>/gi) {
			my ($ad_url, $ad_title) = ($1, $2);
			$ad_url =~ s/&amp;/&/g;
			push(@links, [$ad_url, $ad_title]);
		}

		return @links;
	},
	'active' => 1,
	'urls' => [	'http://forums.timezone.com/index.php?t=threadt&frm_id=32',
			'http://forums.timezone.com/index.php?t=threadt&frm_id=32&start=1',
			'http://forums.timezone.com/index.php?t=threadt&frm_id=71',
			'http://forums.timezone.com/index.php?t=threadt&frm_id=71&start=1'	],
	'cookie' => ''
},
{	
	'sitename' => 'www.tz-uk.com',
	'category' => 'watches',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('phpbb_v1.b', $html, 'http://www.tz-uk.com/forum/');
        },
	'active' => 1,
	'urls' => ['http://www.tz-uk.com/forum/viewforum.php?f=3'],
	'cookie' => ''
},
{
	'sitename' => 'forums.watchuseek.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
                return common_parser::parse('vbulletin4p0p5', $html, '');
	},
	'active' => 1,
	'urls' => [	'http://forums.watchuseek.com/f29/',
			'http://forums.watchuseek.com/f31/'	],
	'cookie' => ''
},
{
	'sitename' => 'watchfreeks.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
                return common_parser::parse('ultrabb1p17b', $html, 'http://www.watchfreeks.com');
	},
	'active' => 1,
	'urls' => [	'http://www.watchfreeks.com/view_forum.php?id=34',
			'http://www.watchfreeks.com/view_forum.php?id=35' ],
	'cookie' => ''
},

{
	'sitename' => 'chronocentric.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
                return common_parser::parse('tetra-webbs6p11', $html, 'http://chronocentric.com/');
	},
	'active' => 1,
	'urls' => [	'http://chronocentric.com/forums/chronotrader/' ],
	'cookie' => ''
},
{
	'sitename' => 'www.equationoftime.com',
	'category' => 'watches',
        'parser' => sub
        {
                my ($html) = @_;
		my @links;

                while($html =~ m/showproduct\.php\?product=(\d+).*?>([^<].*?)<\/a>/gi) {
                        my $ad_url = "http://www.equationoftime.com/classifieds/showproduct.php?product=$1";
                        my $ad_title = $2;

			push(@links, [$ad_url, $ad_title]);
		}

		return @links;
        },
	'active' => 1,
	'urls' => [	'http://www.equationoftime.com/classifieds/showcat.php?cat=2',
			'http://www.equationoftime.com/classifieds/showcat.php?cat=5',
			'http://www.equationoftime.com/classifieds/showcat.php?cat=6',
			'http://www.equationoftime.com/classifieds/showcat.php?cat=7'	],
	'cookie' => ''
},
{
	'sitename' => 'http://www.network54.com/Forum/246582 (big watch)',
	'category' => 'watches',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('network54', $html, 'http://www.network54.com/Forum/246582/');
        },
	'active' => 1,
	'urls' => [	'http://www.network54.com/Forum/246582'	],
	'cookie' => ''
},
{
	'sitename' => 'http://www.network54.com/Forum/353390 (panisteri)',
	'category' => 'watches',
	'parser' => sub
	{
	        my ($html) = @_;
                return common_parser::parse('network54_nolist', $html, 'http://www.network54.com/Forum/353390/');

	},
	'active' => 1,
	'urls' => [	'http://www.network54.com/Forum/353390/	'],
	'cookie' => ''
},
{
	'sitename' => 'www.watchnet.com',
	'category' => 'watches',
	'parser' => sub
	{
		my ($html) = @_;
                return common_parser::parse('watchnet', $html, 'http://forums.watchnet.com/');
	},
	'active' => 1,
	'urls' => [	'http://forums.watchnet.com/index.php?t=threadt&frm_id=85&rid=0'	],
	'cookie' => ''
},

#
# MISC
#
{
	'sitename' => '2ndlight.com',
	'category' => 'misc',
	'parser' => sub
	{
                my ($html) = @_;
                my @links;

                while($html =~ m/<a href="([^"]+)" class="GeneralLink"><strong>([^>]+)>/gi) {
                        my ($ad_url, $ad_title) = ('http://2ndlight.com/fusetalk/forum/'.$1, $2);
			$ad_url =~ s/&amp;/&/g;
                        push(@links, [$ad_url, $ad_title]);
                }

                return @links;
	},
	'active' => 1,
	'urls' => [	'http://2ndlight.com/fusetalk/forum/categories.cfm?catid=5'	],
	'cookie' => ''
},
{
	'sitename' => 'www.offtopic.com',
	'category' => 'misc',
	'parser' => sub
	{
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p2', $html, 'http://forums.offtopic.com/');
	},
	'active' => 1,
	'urls' => [	'http://forums.offtopic.com/forumdisplay.php?f=25'	],
	'cookie' => ''
},
{
        'sitename' => 'e46fanatics.com (misc)',
        'category' => 'misc',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p7p3', $html, 'http://forum.e46fanatics.com/');
        },
        'active' => 1,
        'urls' => [     'http://forum.e46fanatics.com/forumdisplay.php?f=38'	],
        'cookie' => ''
},
{
        'sitename' => 'caraudio.com (misc)',
        'category' => 'misc',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8', $html, 'http://www.caraudio.com/forum/')
        },
        'active' => 1,
        'urls' => [     'http://www.caraudio.com/forum/forumdisplay.php?f=111'    ],
        'cookie' => ''
},
{
        'sitename' => 'ih8mud.com (misc)',
        'category' => 'motors',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8_b', $html, '')
        },
        'active' => 1,
        'urls' => [     'http://forum.ih8mud.com/mud-bay-miscellaneous-sale/'	],
        'cookie' => ''
},

#
# PAINTBALL
#
{
	'sitename' => 'www.impulse-owners.com',
	'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
        	return common_parser::parse('smf_1p1p12', $html, 'http://www.impulse-owners.com/buyselltrade');
        },
	'active' => 1,
	'urls' => [	'http://www.impulse-owners.com/buyselltrade/' ],
	'cookie' => ''
},

{
	'sitename' => 'www.pbreview.com',
	'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
        	return common_parser::parse('vbulletin3p6p2', $html, 'http://www.pbreview.com/forums/');
        },
	'active' => 1,
	'urls' => [	'http://www.pbreview.com/forums/forumdisplay.php?f=36',
                	'http://www.pbreview.com/forums/forumdisplay.php?f=37',
	                'http://www.pbreview.com/forums/forumdisplay.php?f=38',
	                'http://www.pbreview.com/forums/forumdisplay.php?f=39',
	                'http://www.pbreview.com/forums/forumdisplay.php?f=40',
	                'http://www.pbreview.com/forums/forumdisplay.php?f=41',
			'http://www.pbreview.com/forums/forumdisplay.php?f=85'   ],
	'cookie' => ''
},
{
	'sitename' => 'www.sacpaintball.com',
	'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
        	return common_parser::parse('vbulletin3p6p8', $html, 'http://www.sacpaintball.com/forum/');
        },
	'active' => 1,
	'urls' => [	'http://www.sacpaintball.com/forum/forumdisplay.php?f=91',
                	'http://www.sacpaintball.com/forum/forumdisplay.php?f=20',
	                'http://www.sacpaintball.com/forum/forumdisplay.php?f=82',
	                'http://www.sacpaintball.com/forum/forumdisplay.php?f=21',
	                'http://www.sacpaintball.com/forum/forumdisplay.php?f=75',
	                'http://www.sacpaintball.com/forum/forumdisplay.php?f=66'	],
	'cookie' => ''
},
{
	'sitename' => 'Pbnation Electronic Markers',
	'urls' => [	'http://www.pbnation.com/forumdisplay.php?f=141'	],
	'category' => 'paintball',
	%common_sites::pbnation_template
},
{
	'sitename' => 'Pbnation Non-Electronic/Pump Markers',
	'urls' => [	'http://www.pbnation.com/forumdisplay.php?f=144',
			'http://www.pbnation.com/forumdisplay.php?f=192'	],
        'category' => 'paintball',
	%common_sites::pbnation_template
},
{
	'sitename' => 'Pbnation Air Systems',
	'urls' => [	'http://www.pbnation.com/forumdisplay.php?f=142'	],
        'category' => 'paintball',
	%common_sites::pbnation_template
},
{
	'sitename' => 'Pbnation Barrels/Hoppers/Masks/Misc. Equipment',
	'urls' => [	'http://www.pbnation.com/forumdisplay.php?f=177',
			'http://www.pbnation.com/forumdisplay.php?f=408',
			'http://www.pbnation.com/forumdisplay.php?f=418',
			'http://www.pbnation.com/forumdisplay.php?f=143'	],
        'category' => 'paintball',
	%common_sites::pbnation_template
},
{
        'sitename' => 'www.pbnation.com (misc)',
        'urls' => [     'http://www.pbnation.com/forumdisplay.php?f=223'	],
        'category' => 'misc',
        %common_sites::pbnation_template
},
{
	 'sitename' => 'www.gunsnet.net (misc)',
	 'category' => 'misc',	
	 'parser' => sub	
	 {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p2', $html, 'http://www.gunsnet.net/forums/');
	 },
	 'active' => 1,
	 'urls' => [	'http://www.gunsnet.net/forums/forumdisplay.php?f=738'	],
	 'cookie' => ''
},
{
	'sitename' => 'forum.specialopspaintball.com',
	'category' => 'paintball',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('ipb2p1p7', $html, 'http://forum.specialopspaintball.com/');
	},
	'active' => 1,
	'urls' => [	'http://forum.specialopspaintball.com/index.php?showforum=99',
	                'http://forum.specialopspaintball.com/index.php?showforum=100',
	                'http://forum.specialopspaintball.com/index.php?showforum=101',
	                'http://forum.specialopspaintball.com/index.php?showforum=102',
	                'http://forum.specialopspaintball.com/index.php?showforum=103',
	                'http://forum.specialopspaintball.com/index.php?showforum=105',
			'http://forum.specialopspaintball.com/index.php?showforum=109'		],
	'cookie' => ''
},
#{
#	'sitename' => 'www.paintballforum.com (pump, electro, air, misc)',
#	'category' => 'paintball',
#        'parser' => sub
#        {
#                my ($html) = @_;
#        	return common_parser::parse('vbseo', $html, 'http://www.paintballforum.com/forum/');
#        },
#	'active' => 1,
#	'urls' => [	'http://www.paintballforum.com/pump-markers-bst/',
#			'http://www.paintballforum.com/non-electronic-markers/',
#			'http://www.paintballforum.com/electronic-markers/',
#			'http://www.paintballforum.com/air-systems-sale/',
#			'http://www.paintballforum.com/miscellaneous-equipment/'	],
#	'cookie' => ''
#},
#{
#        'sitename' => 'www.paintballforum.com (misc)',
#        'category' => 'misc',
#        'parser' => sub
#        {
#                my ($html) = @_;
#                return common_parser::parse('vbseo', $html, 'http://www.paintballforum.com/forum/');
#        },
#        'active' => 1,
#        'urls' => [     'http://www.paintballforum.com/everything-else/'	],
#        'cookie' => ''
#},
{
	'sitename' => 'automags.org',
	'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
        	return common_parser::parse('vbulletin3p6p2', $html, 'http://www.automags.org/forums/');
        },
	'active' => 1,
	'urls' => [	'http://www.automags.org/forums/forumdisplay.php?f=11',
			'http://www.automags.org/forums/forumdisplay.php?f=19',
			'http://www.automags.org/forums/forumdisplay.php?f=22'		],
	'cookie' => ''
},
{
	'sitename' => 'paintmagazine.com',
	'category' => 'paintball',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('phpbb_v1', $html, 'http://paintmagazine.com/phpBB2/');
	},
	'active' => 1,
	'urls' => ['http://paintmagazine.com/phpBB2/viewforum.php?f=7'],
	'cookie' => ''
},
{
	'sitename' => 'www.angel-owners.com',
	'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
        	return common_parser::parse('vbulletin3p6p2', $html, 'http://www.angel-owners.com/');
        },
	'active' => 1,
	'urls' => [	'http://www.angel-owners.com/forumdisplay.php?f=64',
			'http://www.angel-owners.com/forumdisplay.php?f=63',
			'http://www.angel-owners.com/forumdisplay.php?f=59',
			'http://www.angel-owners.com/forumdisplay.php?f=65',
			'http://www.angel-owners.com/forumdisplay.php?f=62',
			'http://www.angel-owners.com/forumdisplay.php?f=83',
			'http://www.angel-owners.com/forumdisplay.php?f=114',
			'http://www.angel-owners.com/forumdisplay.php?f=69',
			'http://www.angel-owners.com/forumdisplay.php?f=180',
			'http://www.angel-owners.com/forumdisplay.php?f=147',
			'http://www.angel-owners.com/forumdisplay.php?f=181',
			'http://www.angel-owners.com/forumdisplay.php?f=237',
			'http://www.angel-owners.com/forumdisplay.php?f=61',
			'http://www.angel-owners.com/forumdisplay.php?f=34',
			'http://www.angel-owners.com/forumdisplay.php?f=24'	],
	'cookie' => ''
},
{
	'sitename' => 'akaowners.org',
	'category' => 'paintball',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('ipb2p1p7', $html, 'http://akaowners.org/forums/');
	},
	'active' => 1,
	'urls' => [	'http://akaowners.org/forums/index.php?showforum=14',
			'http://akaowners.org/forums/index.php?showforum=15',
			'http://akaowners.org/forums/index.php?showforum=16',
			'http://akaowners.org/forums/index.php?showforum=17'	],
	'cookie' => ''
},
{
	'sitename' => 'z1.invisionfree.com/forums/StockClassPaintbal',
	'category' => 'paintball',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('ipb2p1p7', $html, 'http://z1.invisionfree.com/forums/StockClassPaintball/');
	},
	'active' => 1,
	'urls' => [	'http://z1.invisionfree.com/forums/StockClassPaintball/index.php?showforum=6'	],
	'cookie' => ''
},
{
        'sitename' => 'www.pblegion.com',
        'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8', $html, 'http://www.pblegion.com/');
        },
        'active' => 1,
        'urls' => [	'http://www.pblegion.com/forumdisplay.php?f=10'	],
        'cookie' => ''
},
{
        'sitename' => 'www.mcarterbrown.com',
        'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbseo', $html, 'http://www.mcarterbrown.com/forums/');
        },
        'active' => 1,
        'urls' => [	'http://www.mcarterbrown.com/forums/electronic/',
			'http://www.mcarterbrown.com/forums/mechanical-semi-autos/',
			'http://www.mcarterbrown.com/forums/pump-guns/',
			'http://www.mcarterbrown.com/forums/rare-old-guns/',
			'http://www.mcarterbrown.com/forums/misc-paintball-items/'	],
        'cookie' => ''
},
{
        'sitename' => 'www.mcarterbrown.com (misc)',
        'category' => 'misc',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbseo', $html, 'http://www.mcarterbrown.com/forums/');
        },
        'active' => 1,
        'urls' => [     'http://www.mcarterbrown.com/forums/yard-sale/'	],
        'cookie' => ''
},
{
        'sitename' => 'www.network54.com/Forum/73032/', # doc's machine
        'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('network54', $html, 'http://www.network54.com/Forum/73032/');
        },
        'active' => 1,
        'urls' => [	'http://www.network54.com/Forum/73032/'	],
        'cookie' => ''
},
{
        'sitename' => 'techpb.com',
        'category' => 'paintball',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('ipb3p0p3', $html, '');
        },
        'active' => 1,
        'urls' => [	'http://www.techpb.com/forum/index.php?showforum=986',
			'http://www.techpb.com/forum/index.php?showforum=987',
			'http://www.techpb.com/forum/index.php?showforum=988',
			'http://www.techpb.com/forum/index.php?showforum=989',
			'http://www.techpb.com/forum/index.php?showforum=990',
			'http://www.techpb.com/forum/index.php?showforum=991',
			'http://www.techpb.com/forum/index.php?showforum=992',
			'http://www.techpb.com/forum/index.php?showforum=993'	],
        'cookie' => ''
},

#
# GUNSTUFF
#
{
        'sitename' => 'www.armslist.com',
        'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                my @links;
                while($html =~ m/<td class="title">\s+<a href="(.*?)">(.*?)<\/a>/gi) {
                        push(@links, ["http://www.armslist.com$1", $2]);
                }

                return @links;

        },
        'active' => 1,
        'urls' => [     'http://www.armslist.com/classifieds/usa/guns'	],
        'cookie' => ''
},
{
        'sitename' => 'www.migunowners.org',
        'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8', $html, 'http://www.migunowners.org/forum/');
        },
        'active' => 1,
        'urls' => [     'http://www.migunowners.org/forum/forumdisplay.php?f=142'	],
        'cookie' => ''
},
{
        'sitename' => 'www.calguns.net',
        'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p7p3', $html, 'http://www.calguns.net/calgunforum/');
        },
        'active' => 1,
        'urls' => [     'http://www.calguns.net/calgunforum/forumdisplay.php?f=92',
			'http://www.calguns.net/calgunforum/forumdisplay.php?f=93'	],
        'cookie' => ''
},
{
	'sitename' => 'www.longrangehunting.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbseo', $html, 'http://www.longrangehunting.com/');
        },
	'active' => 1,
	'urls' => [	'http://www.longrangehunting.com/forums/f25/',
			'http://www.longrangehunting.com/forums/f40/',
			'http://www.longrangehunting.com/forums/f41/',
			'http://www.longrangehunting.com/forums/f42/',
			'http://www.longrangehunting.com/forums/f43/',
			'http://www.longrangehunting.com/forums/f66/' 
		],
	'cookie' => ''
},

{
	'sitename' => 'www.akfiles.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p0p0b7', $html, 'http://www.akfiles.com/forums/');
        },
	'active' => 1,
	'urls' => [	'http://www.akfiles.com/forums/forumdisplay.php?f=5' ],
	'cookie' => ''
},
{
	'sitename' => 'www.theakforum.net',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('phpbb_v1', $html, 'http://www.theakforum.net/phpBB2/');
        },
	'active' => 1,
	'urls' => [	'http://www.theakforum.net/phpBB2/viewforum.php?f=26',
			'http://www.theakforum.net/phpBB2/viewforum.php?f=27',
			'http://www.theakforum.net/phpBB2/viewforum.php?f=39',
			'http://www.theakforum.net/phpBB2/viewforum.php?f=54'	],
	'cookie' => ''
},
{
	'sitename' => 'www.defensivecarry.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin4p0p5', $html, 'http://www.defensivecarry.com/vbulletin/');
        },
	'active' => 1,
	'urls' => ['http://www.defensivecarry.com/vbulletin/forumdisplay.php?159-Member-Buy-Sell-amp-Trade'],
	'cookie' => ''
},
{
	'sitename' => 'www.24hourcampfire.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('ultimatebb_24hrcampfire', $html, 'http://www.24hourcampfire.com/');
        },
	'active' => 1,
	'urls' => ['http://www.24hourcampfire.com/ubbthreads/ubbthreads.php/ubb/postlist/Board/14/'],
	'cookie' => ''
},
{
	'sitename' => 'www.falfiles.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin2p3p6', $html, 'http://www.falfiles.com/forums/');
        },
	'active' => 1,
	'urls' => ['http://www.falfiles.com/forums/forumdisplay.php?s=&forumid=11'],
	'cookie' => 'bbpassword=2654fbc06dd67ce90ea1b61a84239167; bbuserid=32251'
},
{
	'sitename' => 'www.6mmbr.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
        
	        my @links;
		#<a href="/tool/post/6mmbr/vpost?id=2256186">Winchester Coyote 270 WSM</a>
                while($html =~ m/<a href="\/tool\/post\/6mmbr\/vpost\?id=(\d+)">(.*?)<\/a>/gi) {
                        my $ad_url = "http://www.websitetoolbox.com/tool/post/6mmbr/vpost?id=$1";
                        my $ad_title = $2;

                        push(@links, [$ad_url, $ad_title]);
                }

                return @links;
        },
	'active' => 1,
	'urls' => [	'http://www.websitetoolbox.com/mb/6mmbr?forum=12196',
			'http://www.websitetoolbox.com/mb/6mmbr?forum=12197'	],
	'cookie' => ''
},
{
	 'sitename' => 'www.hkpro.com',
	 'category' => 'gunstuff',
	 'parser' => sub
	 {
		 my ($html) = @_;
		 return common_parser::parse('vbulletin4p0p5', $html, 'http://hkpro.com/forum/');
	 },
	'active' => 1,
	'urls' => [	'http://hkpro.com/forum/forumdisplay.php?8-HK-PISTOLS-FOR-SALE',
			'http://hkpro.com/forum/forumdisplay.php?10-HK-PARTS-AND-ACCESSORIES-FOR-SALE',
			'http://hkpro.com/forum/forumdisplay.php?104-NON-HK-FIREARMS-FOR-SALE'	],
	'cookie' => ''
},
{
	'sitename' => 'www.ar15.com (ak related)',
	'urls' => [	'http://www.ar15.com/forums/forum.html?b=7&f=122',
			'http://www.ar15.com/forums/forum.html?b=7&f=123'	],
	'category' => 'gunstuff',
	%common_sites::ar15_template
},
{
	 'sitename' => 'www.accurateshooter.com',
	 'category' => 'gunstuff',	
	 'parser' => sub	
	 {
                my ($html) = @_;
                return common_parser::parse('smf2p0rc1p2', $html, 'http://www.accurateshooter.com/forum/index.php/');
	 },
	 'active' => 1,
	 'urls' => [	'http://www.accurateshooter.com/forum/index.php/board,10.0.html',
			'http://www.accurateshooter.com/forum/index.php/board,11.0.html',
			'http://www.accurateshooter.com/forum/index.php/board,19.0.html'	],
	 'cookie' => ''
},

{

	 'sitename' => 'www.gunsnet.net',
	 'category' => 'gunstuff',	
	 'parser' => sub	
	 {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p2', $html, 'http://www.gunsnet.net/forums/');
	 },
	 'active' => 1,
	 'urls' => [	'http://www.gunsnet.net/forums/forumdisplay.php?f=36',
			'http://www.gunsnet.net/forums/forumdisplay.php?f=610',
			'http://www.gunsnet.net/forums/forumdisplay.php?f=195'	],
	 'cookie' => ''
},
{
	 'sitename' => 'forums.accurateloading.com',
	 'category' => 'gunstuff',	
	 'parser' => sub	
	 {
                my ($html) = @_;


#<a href="http://forums.accuratereloading.com/eve/forums/a/tpc/f/2711043/m/806101457" class="ev_ubbx_frm_title_link">Reamers and Headspace Gauges for Sale</a>
#<a href="http://forums.accuratereloading.com/eve/forums/a/tpc/f/2711043/m/557107457" class="ev_ubbx_frm_title_link">WTB-WTT Synthetic Stock for  New Walnut Stock, Rem 700 in 300 win mag</a>
#<a href="http://forums.accuratereloading.com/eve/forums/a/tpc/f/2711043/m/524103457" class="ev_ubbx_frm_title_link">WTB Remington 700 VS Sto
	        my @links;
                
		while($html =~ m/<a href="(http:\/\/forums\.accuratereloading\.com\/eve\/forums\/a\/tpc\/f\/\d+\/m\/\d+)" class="ev_ubbx_frm_title_link">(.*?)<\/a>/gi) {
                        my $ad_url = $1;
                        my $ad_title = $2;

                        push(@links, [$ad_url, $ad_title]);
                }

                return @links;
	 },
	 'active' => 1,
	 'urls' => [	'http://forums.accuratereloading.com/eve/forums/a/frm/f/2711043/p/1'	],
	 'cookie' => ''
},

{
	'sitename' => 'www.ar15.com (ar15 related)',
	'urls' => [	'http://www.ar15.com/forums/forum.html?b=7&f=21',
			'http://www.ar15.com/forums/forum.html?b=7&f=24',
			'http://www.ar15.com/forums/forum.html?b=7&f=125',
			'http://www.ar15.com/forums/forum.html?b=7&f=22',
			'http://www.ar15.com/forums/forum.html?b=7&f=119',
			'http://www.ar15.com/forums/forum.html?b=7&f=25'	],
        'category' => 'gunstuff',
	%common_sites::ar15_template
},
{
	'sitename' => 'www.ar15.com (optics)',
	'urls' => [	'http://www.ar15.com/forums/forum.html?b=7&f=23'	],
        'category' => 'gunstuff',
	%common_sites::ar15_template
},
{
	'sitename' => 'www.ar15.com (rifle/shotgun related)',
	'urls' => [	'http://www.ar15.com/forums/forum.html?b=7&f=93',
			'http://www.ar15.com/forums/forum.html?b=7&f=92',
			'http://www.ar15.com/forums/forum.html?b=7&f=47'	],
        'category' => 'gunstuff',
	%common_sites::ar15_template
},
{
	'sitename' => 'www.ar15.com (handgun related)',
	'urls' => [	'http://www.ar15.com/forums/forum.html?b=7&f=88',
			'http://www.ar15.com/forums/forum.html?b=7&f=89'	],
        'category' => 'gunstuff',
	%common_sites::ar15_template
},
{
	'sitename' => 'www.ar15.com (ammo, ar10, nfa, curio)',
	'urls' => [	'http://www.ar15.com/forums/forum.html?b=7&f=133',
			'http://www.ar15.com/forums/forum.html?b=7&f=120',
			'http://www.ar15.com/forums/forum.html?b=7&f=118',
			'http://www.ar15.com/forums/forum.html?b=7&f=131'	],
        'category' => 'gunstuff',
	%common_sites::ar15_template
},
{
	'sitename' => 'www.ar15.com (misc)',
	'urls' => [	'http://www.ar15.com/forums/forum.html?b=7&f=91'	],
        'category' => 'misc',
	%common_sites::ar15_template
},
{
	'sitename' => 'smith-wessonforum.com',
	'category' => 'gunstuff',
	'parser' => sub
	{
		my ($html) = @_;

		my @links;

                while($html =~ m/<a href="(http:\/\/smith-wessonforum\.com\/eve\/forums\/a\/tpc\/f\/\d+\/m\/\d+)" class="ev_ubbx_frm_title_link">(.*?)<\/a>/gi) {
                        my $ad_url = $1;
                        my $ad_title = $2;

                        next unless($ad_title);
                        next if($ad_title =~ m/^</);
                        next if($ad_title =~ m/^\d+$/);

                        $ad_title =~ s/<img.*?>//g;

			push(@links, [$ad_url, $ad_title]);
		}

		return @links;
	
	},
	'active' => 1,
	'urls' => [	'http://smith-wessonforum.com/eve/forums/a/frm/f/511103904'	],
	'cookie' => 'JServSessionIdeve_zone=88lb99tzf1.eve2da035; ll_884106832=0; cl_884106832=1166851148085; site_884106832=u=andrewwl&md5p=DCD3E6EEF681A68D19F93642A94A30FB&user_oid=6811048861&pref_datetime=&perms_datetime=&pl=Y'
},
{
	'sitename' => 'floridashootersnetwork.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
		#print $html;
		#return;
                return common_parser::parse('phpbb_v3', $html, 'http://floridashootersnetwork.com/phpbb3/');
        },
	'active' => 1,
	'urls' => ['http://www.floridashootersnetwork.com/phpbb3/viewforum.php?f=10'],
	'cookie' => 'phpbb3_issux_u=806; phpbb3_issux_k=98d25bab79386fc4; phpbb3_issux_sid=ccc77d57b58e2be4b85437b16bd90054'
},
{
	'sitename' => 'www.glocktalk.com (guns)',
	'urls' => ['http://www.glocktalk.com/forums/forumdisplay.php?forumid=39'],
        'category' => 'gunstuff',
	%common_sites::glocktalk_template
},
{
	'sitename' => 'www.glocktalk.com (parts, accessories)',
	'urls' => [	'http://www.glocktalk.com/forums/forumdisplay.php?forumid=40',
			'http://www.glocktalk.com/forums/forumdisplay.php?forumid=41',
			'http://www.glocktalk.com/forums/forumdisplay.php?forumid=42'	],
        'category' => 'gunstuff',
	%common_sites::glocktalk_template
},
{
	'sitename' => 'www.glocktalk.com (misc)',
	'urls' => [	'http://www.glocktalk.com/forums/forumdisplay.php?forumid=43'	],
        'category' => 'misc',
	%common_sites::glocktalk_template
},

{
	'sitename' => 'www.rimfirecentral.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                my @links;

#             <a href="vbclassified.php?do=ad&amp;id=1505">WTB: Ruger 10/22 Magnum Bolt</a>
                while($html =~ m/<a href="(vbclassified\.php\?do=ad&amp;id=\d+)">([^<].*?)<\/a>/gi)
		{
                        my $ad_url = 'http://www.rimfirecentral.com/forums/'.$1;
                        my $ad_title = $2;

			$ad_url =~ s/&amp;/&/g;

                        push(@links, [$ad_url, $ad_title]);
                }

                return @links;

        },
	'active' => 1,
	'urls' => ['http://www.rimfirecentral.com/forums/vbclassified.php'],
	'cookie' => ''
},
{
	'sitename' => 'www.sturmgewehr.com (semi-auto)',
	'urls' => ['http://www.sturmgewehr.com/webBBS/semi4sale.cgi'],
        'category' => 'gunstuff',
	%common_sites::sturmgewehr_template
},
{
	'sitename' => 'www.sturmgewehr.com (nfa)',
	'urls' => ['http://www.sturmgewehr.com/webBBS/nfa4sale.cgi'],
        'category' => 'gunstuff',
	%common_sites::sturmgewehr_template
},
{
	'sitename' => 'www.sturmgewehr.com (parts)',
	'urls' => ['http://www.sturmgewehr.com/webBBS/parts.cgi'],
        'category' => 'gunstuff',
	%common_sites::sturmgewehr_template
},
{
	'sitename' => 'www.sturmgewehr.com (collectors)',
	'urls' => ['http://www.sturmgewehr.com/webBBS/collectors.cgi'],
        'category' => 'gunstuff',
	%common_sites::sturmgewehr_template
},

{
	'sitename' => 'www.snipershide.com',
	'category' => 'gunstuff',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('ultimatebb_snipershide', $html, 'http://www.snipershide.com');
	},
	'active' => 1,
	'urls' => [	'http://www.snipershide.net/forum/ubbthreads.php?ubb=postlist&Board=15&page=1',
			    'http://www.snipershide.net/forum/ubbthreads.php?ubb=postlist&Board=21&page=1',
                'http://www.snipershide.com/forum/ubbthreads.php?ubb=postlist&Board=39&page=1'
            ],
	'cookie' => ''
},
{
	'sitename' => 'www.thehighroad.us',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p7p3', $html, 'http://www.thehighroad.us/');
        },
	'active' => 1,
	'urls' => [	'http://www.thehighroad.us/forumdisplay.php?f=22',
			'http://www.thehighroad.us/forumdisplay.php?f=38',
			'http://www.thehighroad.us/forumdisplay.php?f=23',
			'http://www.thehighroad.us/forumdisplay.php?f=50'	],
	'cookie' => 'bbsessionhash=465388691182cf3934ee737477d06e86; bbuserid=32034; bbpassword=96379d6232623761ee2587bd9a2ea795'
},
{
	'sitename' => 'www.1911forum.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p2', $html, 'http://forums.1911forum.com/');
        },
	'active' => 1,
	'urls' => [	'http://forums.1911forum.com/forumdisplay.php?f=23'	],
	'cookie' => ''
},
{
	'sitename' => 'www.berettaforum.net',
	'category' => 'gunstuff',
	'parser' => sub
	{
                my ($html) = @_;
		print $html;
                return common_parser::parse('vbulletin3p6p8', $html, 'http://www.berettaforum.net/vb/');
        },
	'active' => 0,
	'urls' => [	'http://www.berettaforum.net/vb/forumdisplay.php?f=18'	],
	'cookie' => ''
},
{
	'sitename' => 'www.sigforum.com',
	'category' => 'gunstuff',
	'parser' => sub
        {
                my ($html) = @_;
		my @links;

		while($html =~ m/<a href="([^ ]*?)" class="ev_ubbx_frm_title_link">(.*?)<\/a>/gi) {
			my $ad_url = $1;
			my $ad_title = $2;

			push(@links, [$ad_url, $ad_title]);
		}

		return @links;
        },
	'active' => 1,
	'urls' => [	'http://sigforum.com/eve/forums/a/frm/f/350601935'	],
	'cookie' => ''
},
{
	'sitename' => 'www.thefiringline.com',
	'category' => 'gunstuff',
	'parser' => sub
	{
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p2', $html, 'http://www.thefiringline.com/forums/');
	},
	'active' => 1,
	'urls' => [	'http://www.thefiringline.com/forums/forumdisplay.php?f=17',
			'http://www.thefiringline.com/forums/forumdisplay.php?f=14',
			'http://www.thefiringline.com/forums/forumdisplay.php?f=16'	],
	'cookie' => ''
},
{
	'sitename' => 'www.gunboards.com',
	'category' => 'gunstuff',
	'parser' => sub
	{
		my ($html) = @_;
		return common_parser::parse('vbulletin4p0p5', $html, 'http://forums.gunboards.com/');
	},
	'active' => 1,
	'urls' => [	'http://forums.gunboards.com/forumdisplay.php?75-The-Trader-WTS-and-WTT-listing-board'	],
	'cookie' => ''
},
{	
	'sitename' => 'www.gunco.net',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8_b', $html, 'http://www.gunco.net/forums/');
        },
	'active' => 1,
	'urls' => [	'http://www.gunco.net/forums/f259/' ],
	'cookie' => ''
},
{	
	'sitename' => 'www.xdtalk.com',
	'category' => 'gunstuff',
	'parser' => sub
	{
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8_b', $html, '');
        },
	'active' => 1,
	'urls' => [	'http://www.xdtalk.com/forums/xd-firearms-sale/',
			'http://www.xdtalk.com/forums/xd-accessories-sale/',
			'http://www.xdtalk.com/forums/other-firearms-sale/',
			'http://www.xdtalk.com/forums/other-firearms-accessories-sale/'],
	'cookie' => ''
},
{	
	'sitename' => 'www.rugerforum.com',
	'category' => 'gunstuff',
	'parser' => sub
	{
		my ($html) = @_;

		return common_parser::parse('phpbb_v1', $html, 'http://www.rugerforum.org/phpBB/');
	},
	'active' => 1,
	'urls' => ['http://www.rugerforum.org/phpBB/viewforum.php?f=41'],
	'cookie' => ''
},
{
	'sitename' => 'www.shotgunworld.com',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('phpbb_v1.b', $html, 'http://www.shotgunworld.com/bbs/');
        },
	'active' => 1,
	'urls' => [	'http://www.shotgunworld.com/bbs/viewforum.php?f=74',
			'http://www.shotgunworld.com/bbs/viewforum.php?f=69',
			'http://www.shotgunworld.com/bbs/viewforum.php?f=70',
			'http://www.shotgunworld.com/bbs/viewforum.php?f=72',
			'http://www.shotgunworld.com/bbs/viewforum.php?f=71',
			'http://www.shotgunworld.com/bbs/viewforum.php?f=73'		],
	'cookie' => ''
},
{
	'sitename' => 'www.czforumsite.info',
	'category' => 'gunstuff',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('smf_1p1p10', $html, 'http://www.czforumsite.info/');
        },
	'active' => 1,
	'urls' => [	'http://www.czforumsite.info/index.php?board=31.0',
			'http://www.czforumsite.info/index.php?board=30.0'],
	'cookie' => ''
},

{
	'sitename' => 'www.tampaforums.com',
	'category' => 'misc',
        'parser' => sub
        {
                my ($html) = @_;
		my @links;

                while($html =~ m/<a href="(http.*?)">(.*?)<\/a>/gis) {
                        #next if (substr($2, 0, 1) eq '<');
                        my ($ad_url, $ad_title) = ($1, $2);

                        $ad_title =~ s/<.*?>//g;

                        next unless($ad_title);
                        next if($ad_title =~ m/^\d+$/);
                        next if($ad_title =~ m/^last/i);
                        #next unless($ad_url =~ m/\.html/);

			push(@links, [$ad_url, $ad_title]);
		}

		return @links;
        },
	'active' => 1,
	'urls' => [	'http://www.tampaforums.com/forums/electronics-fs/',
			'http://www.tampaforums.com/forums/home-furnishings-fs/',
			'http://www.tampaforums.com/forums/miscellaneous-fs/',
			'http://www.tampaforums.com/forums/sports-recreation-fs/',
			'http://www.tampaforums.com/forums/tools-equipment-fs/',
			'http://www.tampaforums.com/forums/pets-fs/',
			'http://www.tampaforums.com/forums/school-education-fs/'	],
	'cookie' => ''
},

#
# COMPUTERS
#
{
        'sitename' => 'anandtech',
        'category' => 'computers',
	    'login_url' => 'http://forums.anandtech.com/login.php',	
    	'login_post' => {        'vb_login_username'=>'TomStone',
                                 'vb_login_md5password'=>'725255cbcc3259441dfdca0d802c3190',
                                 'vb_login_md5password_utf'=>'725255cbcc3259441dfdca0d802c3190',
                                 'do'=>'login',
                                 'vb_login_password'=>''
			},
        'parser' => sub
        {
                my ($html) = @_;
		#print $html;
                return common_parser::parse('vbulletin3p6p8', $html, 'http://forums.anandtech.com/');
        },
        'active' => 1,
        'urls' => [     'http://forums.anandtech.com/forumdisplay.php?f=19'	],
},

{
        'sitename' => 'dslreports',
        'category' => 'computers',
        'parser' => sub
        {
                my ($html) = @_;
		#print $html;
		my @links = ();
		while($html =~ m/<A id="nt".*?HREF="([^"]+)"> ([^<]+)<\/A>/g) {
			push(@links, ['http://www.dslreports.com'.$1, $2]);
		}
		return @links;	
        },
        'active' => 1,
        'urls' => [     'http://www.dslreports.com/forum/forsale'	],
},

{
        'sitename' => 'hardforum',
        'category' => 'computers',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p8p4', $html, 'http://hardforum.com/');
        },
        'active' => 1,
        'urls' => [     'http://hardforum.com/forumdisplay.php?f=17'	],
},

{
        'sitename' => 'techpowerup',
        'category' => 'computers',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p8p4', $html, 'http://forums.techpowerup.com/');
        },
        'active' => 1,
        'urls' => [     'http://forums.techpowerup.com/forumdisplay.php?f=43'	],
},

#
# AQUARIA
#
{
        'sitename' => 'plantedtank.net',
        'category' => 'aquaria',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbseo', $html, 'http://www.plantedtank.net/forums/');
        },
        'active' => 1,
        'urls' => [     'http://www.plantedtank.net/forums/swap-n-shop/'	],
        'cookie' => 'bbuserid=2567; bbpassword=57132bad643122022aed43c444912b75'
},
{
        'sitename' => 'aquaticplantcentral.com',
        'category' => 'aquaria',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p6p8_b', $html, 'http://www.aquaticplantcentral.com/forumapc/');
        },
        'active' => 1,
        'urls' => [     'http://www.aquaticplantcentral.com/forumapc/sale-trade/'        ],
        'cookie' => ''
},
{
        'sitename' => 'reefcentral.com',
        'category' => 'aquaria',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('vbulletin3p8p4', $html, 'http://reefcentral.com/forums/');
        },
        'active' => 1,
        'urls' => [     'http://reefcentral.com/forums/forumdisplay.php?f=2'        ],
        'cookie' => ''
},
{
        'sitename' => 'nano-reef.com',
        'category' => 'aquaria',
        'parser' => sub
        {
                my ($html) = @_;
                return common_parser::parse('ipb2p1p7', $html, 'http://www.nano-reef.com/forums/');
        },
        'active' => 1,
        'urls' => [     'http://www.nano-reef.com/forums/index.php?showforum=11'        ],
        'cookie' => ''
}

);

1;


