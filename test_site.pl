#!/usr/bin/perl

# EliteDealSeeker-Core
# Website Tester: command-line interface to core api
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

# perl stuff
use warnings;
use strict;
use Data::Dumper;

# our stuff
use central_settings;
use core_api;

# if site is given as argument, visit site and parse ads, showing result
if($ARGV[0]) {
    my $site_name = $ARGV[0];

    my @dbdata;
    @dbdata = core_api::get_and_parse_ads($site_name, 1);

	print Dumper(\@dbdata);
}
# otherwise list all sites that are available
else {
	foreach my $site(@central_settings::sites_info) {
		print $site->{'sitename'}."\n";
	}
}	
