#!/usr/bin/perl

# EliteDealSeeker-Core
# Core API: one function to call to get and parse links
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
use user_agent;

package core_api;

sub get_and_parse_ads($$)
{
    my ($site_name, $debug) = @_;

    # scan through sites list for request site
	my %site;
	foreach my $site_HR(@central_settings::sites_info) {
		if($site_HR->{'sitename'} eq $site_name) {
            %site = %$site_HR;
            last;
        }
    }
    die "unknown site: $site_name\n" unless(%site);

    print 'site:     ', $site{'sitename'}, "\n" if($debug);
    print 'category: ', $site{'category'}, "\n" if($debug);	

    # build and return this
    my @dbdata;

    # each site may have multiple URL's to visit within
    foreach my $url(@{$site{'urls'}}) {
        next unless($url);


        # if cookie specified, add it to custom headers
        my %custom_headers = $site{'cookie'} ? ('Cookie' => $site{'cookie'}) : ();

        # if login url and post data are given, post to url and append returned cookies to our outgoing cookies
        if($site{'login_url'} && $site{'login_post'}) {
            my %new_cookies;

            print "logging in: ".$site{'login_url'}."\n" if($debug);

            if(user_agent::post_cookie($site{'login_url'}, $site{'login_post'}, {}, \%new_cookies)) {
                my $first = 1;

                while(my($cname, $cval) = each %new_cookies) {
                    $custom_headers{'Cookie'} .= '; ' unless($first);
                    $first = 0;
                    $custom_headers{'Cookie'} .= "$cname=$cval";
                }

                print "Cookie: ".$custom_headers{'Cookie'}."\n" if($debug);
            }
            else {
                print "login error\n" if($debug);
            }
        }

        # seek the website content itself
        print 'visiting: ', $url, "\n" if($debug);

        my $html = user_agent::get($url, \%custom_headers);
        
        unless($html) {
            print "no html\n" if($debug);
            next;
        }

        print "html len: ".length($html)."\n" if($debug);
        print $html;

        # call parser function on the website content
    	my @links = $site{'parser'}($html);

        # build array for database consumption
        foreach(@links) {
            next unless($_);
            my ($ad_url, $ad_title) = @$_;
            push(@dbdata, [$ad_url, $ad_title, $site{'sitename'}, $site{'category'}]);
        }
    }

    # return array
    return @dbdata;
} 

1;
