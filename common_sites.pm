#!/usr/bin/perl

# EliteDealSeeker-Core
# Common Sites Module: holds list of categories, sites
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

use warnings;
use strict;

use common_parser;

package common_sites;

our %pbnation_template = (
	        'parser' => sub
	        {
	                my ($html) = @_;
	                return common_parser::parse('vbulletin3p6p2', $html, 'http://www.pbnation.com/');
	        },
	        'active' => 1,
        	'cookie' => 'bbuserid=60818; bbpassword=f4493f55ef1528755c12a54775f45a13'
	);

our %ar15_template = (
		'parser' => sub
		{
			my ($html) = @_;
			my @links;

			#print $html;

			while($html =~ m/href="(topic\.html[^"]+)"[^>]+>([^<]+)<\/a>/gsi) {
			        my $ad_url = "http://www.ar15.com/forums/$1";
			        my $ad_title = $2;

				next if $ad_title =~ m/^\d+$/g;
			        $ad_url =~ s/&amp;/&/g;
				$ad_title =~ s/<b>(.*?)<\/b>/$1/g;

				push(@links, [$ad_url, $ad_title]);
			}

			return @links;
		},

		'active' => 0,
		'cookie' => ''
	);

our %glocktalk_template = (
		'parser' => sub
		{
			my ($html) = @_;
			return common_parser::parse('vbulletin3p6p5', $html, 'http://www.glocktalk.com/forums/');
		},
	
		'active' => 1,
		'cookie' => ''
	);

our %sturmgewehr_template = (
		'parser' => sub
		{
			my ($html) = @_;
			return common_parser::parse('webbbs4p33', $html, '');
		},
		'active' => 1,
		'cookie' => ''
	);

1;
