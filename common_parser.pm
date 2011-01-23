#!/usr/bin/perl

# EliteDealSeeker-Core
# Common Parser: routines to parse posts from recurring forum software
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

package common_parser;

sub parse
{
	my ($type, $html, $prefix_url) = @_;

	my @links;

	if($type eq 'vbseo') {
		while($html =~ m/<a href="([^"]*)" id="thread_title_\d+">(.*?)<\/a>/gi) {
			push(@links, [$1, $2])
		}
	}
	
	elsif($type eq 'vbulletin2p3p6') {
		while($html =~ m/<a href="showthread.php.*?(threadid=\d+)">([^<].*?)<\/a>/gi) {
		        push(@links, [$prefix_url."showthread.php?$1", $2]);
		}
	}

	elsif($type eq 'vbulletin3p0p0b7') {
		while($html =~ m/<a href="showthread\.php.*?(t=\d+)" title=".*?">([^<].*?)<\/a>/gsi) {
		        push(@links, [$prefix_url."showthread.php?$1", $2]);
		}
	}

	elsif($type eq 'vbulletin3p6p2') {
		while($html =~ m/<a href="showthread.php.*?(t=\d+).*?">([^<].*?)<\/a>/gi) {
			next if($2 =~ m/^\d+$/);
			push(@links, [$prefix_url."showthread.php?$1", $2]);
		}
	}

	elsif($type eq 'vbulletin3p6p5') {
		while($html =~ m/<a href="showthread\.php.*?(t=\d+).*?">([^<].*?)<\/a>/gi) {
			push(@links, [$prefix_url."showthread.php?$1", $2]);
		}
	}

	elsif($type eq 'vbulletin3p6p8') {
		while($html =~ m/<a href="showthread\.php.*?(t=\d+).*?">([^<].*?)<\/a>/gi) {
			next if($2 =~ m/^\d+$/);
			push(@links, [$prefix_url."showthread.php?$1", $2]);
		}
	}

	elsif($type eq 'vbulletin3p6p8_b') {
		while($html =~ m/<a href="([^"]+)" id="thread_title_\d+">([^<]+)<\/a>/gi) {
			push(@links, [$prefix_url.$1, $2]);
		}
	}

    elsif($type eq 'vbulletin3p7p3') {
        while($html =~ m/<a href="showthread\.php\?.*?(t=\d+)"[^>]+>([^<]+)<\/a>/gi) {
            push(@links, [$prefix_url."showthread.php?".$1, $2]);
        }
    }

    elsif($type eq 'vbulletin3p8p0') {
        while($html =~ m/<a href="showthread\.php\?.*?(t=\d+)"[^>]+>([^<]+)<\/a>/gi) {
            push(@links, [$prefix_url."showthread.php?".$1, $2]);
        }
    }

	elsif($type eq 'vbulletin3p8p4') {
		while($html =~ m/<a href="([^"]+)" id="thread_title_\d+">([^<]+)<\/a>/gi) {
			my $ad_url = $prefix_url.$1;
			my $ad_title = $2;

			$ad_url =~ s/&amp;/&/;
			$ad_url =~ s/\?s=[^&]+&/\?/g;
			push(@links, [$ad_url, $ad_title]);
		}
	}

	elsif($type eq 'vbulletin4p0p5') {
		while($html =~ m/<a class="title" href="([^"]+)" id="thread_title_\d+">([^<]+)<\/a>/gi) {
			my $ad_url = $prefix_url.$1;
			my $ad_title = $2;

			$ad_url =~ s/&amp;/&/;
			$ad_url =~ s/\&s=[[:xdigit:]]+$//;
			push(@links, [$ad_url, $ad_title]);
		}
	}

	elsif($type eq 'ipb2p1p7') {
		while($html =~ m/showtopic=(\d+)" title=".*?">(.*?)<\/a>/gis) {
			my $ad_url = $prefix_url."index.php?showtopic=$1";
			my $ad_title = $2;

			$ad_title =~ s/<.*?>//g;

			push(@links, [$ad_url, $ad_title]);
		}

	}

	elsif($type eq 'ipb3p0p3') {
		while($html =~ m/<a id="tid-link-\d+" href="([^"]+)" [^>]+>([^<]+)<\/a>/gis) {
			my ($url,$title) = ($1,$2);
			$url =~ s/\?s=[0-9A-Fa-f]{32}//;
			push(@links, [$url, $title]);
		}

	}

	elsif($type eq 'phpbb_v1') {
		while($html =~ m/<a href="viewtopic\.php\?t=(\d+).*?">([^<].*?)<\/a>/gi) {
			my $ad_url = $prefix_url."viewtopic.php?t=$1";
			my $ad_title = $2;

			next if $ad_title =~ m/^\d+$/;

			push(@links, [$ad_url, $ad_title]);
		}

	}

	elsif($type eq 'phpbb_v1.b') {
		while($html =~ m/;t=(\d+)[^>]+>([^<]+)<\/a>/gi) {
			my $ad_url = $prefix_url."viewtopic.php?t=$1";
			my $ad_title = $2;

			next if $ad_title =~ m/^\d+$/;

			push(@links, [$ad_url, $ad_title]);
		}
	}

	elsif($type eq 'phpbb_v3') {
		while($html =~ m/href="\(.*?\)" class=\"topictitle\">\(.*?\)<\/a>/gi) {
			my $ad_url = $prefix_url.$1;
			my $ad_title = $2;

			next if $ad_title =~ m/^\d+$/;

			push(@links, [$ad_url, $ad_title]);
		}
	}

    elsif($type eq 'smf2p0rc1p2') {
        while($html =~ m/(topic=\d+\.\d)">([^<]*)<\/a>/gis) {
            push(@links, [$prefix_url.$1.'.html', $2]);
        }
    }

	elsif($type eq 'ultrabb1p17') {
		while($html =~ m/href="\/(forum\d+\/\d+\.html)">([^<]*)<\/a>/gis) {
			push(@links, [$prefix_url.$1, $2]);
		}
	}

	elsif($type eq 'ultrabb1p17b') {
		while($html =~ m/href="(\/view_topic\.php\?id=\d+&forum_id=\d+)">([^<]*)<\/a>/gis) {
			push(@links, [$prefix_url.$1, $2]);
		}
	}

    elsif($type eq 'network54') {
        $prefix_url =~ m/(\d+)\//;
        my $forum_number = $1;

        $html = filter_out_top_level_list($html);

        while($html =~ m/<a href="\/Forum\/$forum_number\/message\/(\d+)\/.*?">(.*?)<\/a>/gis) {
            my $ad_url = $prefix_url."message/$1";
            my $ad_title = $2;

            next unless($ad_title);

            push(@links, [$ad_url, $ad_title]);        
        }
    }

    elsif($type eq 'network54_nolist') {
        $prefix_url =~ m/(\d+)\//;
        my $forum_number = $1;

        while($html =~ m/<a href="\/Forum\/$forum_number\/thread\/(\d+)\/.*?">(.*?)<\/a>/gis) {
            my $ad_url = $prefix_url."message/$1";
            my $ad_title = $2;

            next unless($ad_title);

            push(@links, [$ad_url, $ad_title]);
        }
    }

	elsif($type eq 'tetra-webbs5p31') {
		while($html =~ m/'thread'><a name='m_\d+' id='m_\d+' href='(.*?)'>(.*?)<\/a>/gi) {
			my $ad_url = $prefix_url.$1;
			my $ad_title = $2;
			
			push(@links, [$ad_url, $ad_title]);	
		}
	}

	elsif($type eq 'tetra-webbs6p11') {
		while($html =~ m/href='(.*?\?page=\d+;md=read;id=\d+)'>(.*?)<\/a>/gi) {
			my $ad_url = $prefix_url.$1;
			my $ad_title = $2;
			
			push(@links, [$ad_url, $ad_title]);	
		}
	}

	elsif($type eq 'webbbs5p11') {

		$html = filter_top_level_dd($html);
		
		while($html =~ m/<a name=.*?read=(\d+)">(.*?)<\/a>/gi) {
			my $ad_url = $prefix_url."?read=$1";
			my $ad_title = $2;
			
			$ad_title =~ s/<.*?>//g;

			push(@links, [$ad_url, $ad_title]);	
		}
	}

	elsif($type eq 'webbbs5p00') {
		
		$html = filter_out_top_level_list($html);
		
		while($html =~ m/<a name=.*?read=(\d+)">(.*?)<\/a>/gi) {
			my $ad_url = $prefix_url."?read=$1";
			my $ad_title = $2;
			
			$ad_title =~ s/<.*?>//g;

			push(@links, [$ad_url, $ad_title]);	
		}
	}

	elsif($type eq 'watchnet') {
		while($html =~ m/goto=(\d+)&amp;rid=0">(.*?)<\/a>/gi) {
			push(@links, [$prefix_url."index.php?t=tree&goto=$1&rid=0", $2]);
		}
	}

	elsif($type eq 'webbbs4p33') {
		while($html =~ m/href=['"].*?(\/webBBS\/[\w]+\.cgi\?read=\d+)['"]>(.*?)<\/a>/gi) {
			my ($link, $title) = ($1, $2);

			$link = 'http://www.sturmgewehr.com'.$link unless($link =~ m/^http/);
			
			push(@links, [$link, $title]);
		}
	}

	elsif($type eq 'ultimatebb6p7p2') {
		while($html =~ m/<a href="$prefix_url.*?(ultimatebb\.php\?ubb=get_topic;f=\d+;t=\d+)">(.*?)<\/a>/gi) {
			push(@links, [$prefix_url.$1, $2]);
		}
	}

	elsif($type eq 'ultimatebb_snipershide') {
		while($html =~ m/<a href="(\/forum\/ubbthreads\.php\?ubb=showflat&amp;Number=\d+)[^"]+">([^<]+)<\/a>/gi) {
			my ($url, $title) = ($1, $2);
			$url =~ s/&amp;/&/g;
			push(@links, [$prefix_url.$url, $title]);
		}
	}

	elsif($type eq 'ultimatebb_24hrcampfire') {
		while($html =~ m/<a href="\/(ubbthreads\/ubbthreads\.php\/topics\/\d+\/[^"]+)">([^<]+)<\/a>/gi) {
			my ($url, $title) = ($1, $2);
			next if($title =~ m/^\d+$/);
			push(@links, [$prefix_url.$url, $title]);
		}
	}

	elsif($type eq 'wowbb_1p7') {
		while($html =~ m/<a href="\/(view_topic\.php\?id=\d+).*?">([^<].*?)<\/a>/gi) {
			my ($url, $title) = ($1, $2);
			next if($title =~ m/^\d+$/);
			push(@links, [$prefix_url.$url, $title]);
		}
	}

	elsif($type eq 'ipboard_2p3p1') {
		while($html =~ m/(showtopic=\d+)"[^>]*>([^<]*)<\/a>/gi) {
			push(@links, [$prefix_url."index.php?$1", $2]);
		}
	}
	
	elsif($type eq 'craigslist') {
		while($html =~ m/<a href="http:\/\/.*?\.craigslist.org(\/(\w\w\w\/)?\w\w\w\/\d+\.html)">([^<].*?)<\/a>/gi) {
			push(@links, [$prefix_url.$1, $3]);
		}
	}

	elsif($type eq 'smf_1p1p10') {
		while($html =~ m/<a href="(.*?index\.php.*?topic=\d+\.\d)">(.*?)<\/a>/gi) {
			my ($title,$url)=($2,$1);
			$url =~ s/&amp;/&/g;
			$url =~ s/PHPSESSID=[\w\d]+&//g;
			push(@links, [$url,$title]);
		}
	}

	elsif($type eq 'smf_1p1p12') {
		while($html =~ m/<span id="msg_\d+"><a href="($prefix_url[^"]+)">([^<]+)<\/a>/mgi) {
			my ($title,$url)=($2,$1);
			$url =~ s/&amp;/&/g;
			$url =~ s/\/\?PHPSESSID=[\w\d]+$//g;
			push(@links, [$url,$title]);
		}
	}

	elsif($type eq 'smf_2p0rc2') {
		while($html =~ m/<a href="($prefix_url\/index\.php\/topic,[\d\.]+\.html)[^>]+>([^<]+)<\/a>/gi) {

			push(@links, [$1, $2]);
		}
	}

	else {
		push(@links, ["the $type parser is not recognised by common parser", 'unknown common parser']);
	}

	return @links;
};

sub filter_out_top_level_list
{
        my ($html) = @_;

        my @ul_stack = ();
        my @top_order_li = ();

        for(my $i=0; $i < length $html; ) {
                if(substr($html, $i, 64) =~ m/^(<[ou]l.*?>)/i) {
                        push(@ul_stack, 1);
                        $i += length($1);
                } elsif(substr($html, $i, 64) =~ m/^(<\/[ou]l.*?>)/i) {
                        pop(@ul_stack);
                        $i += length($1);
                } elsif(scalar(@ul_stack) == 1) {
                        push(@top_order_li, substr($html, $i, 1));
                        $i += 1;
                } else {
                        $i += 1;
                }
        }

        return join('', @top_order_li);
}

sub filter_top_level_dd
{
	my ($html) = @_;

	my @dl_stack = ();
	my @top_order_dd = ();

	for(my $i=0; $i < length $html; ) {
		if(substr($html, $i, 4) =~ m/<dl>/i) {
			push(@dl_stack, 1);
			$i += 4;
		} elsif(substr($html, $i, 5) =~ m/<\/dl>/i) {
			pop(@dl_stack);
			$i += 5;
		} elsif(scalar(@dl_stack) == 1) {
			push(@top_order_dd, substr($html, $i, 1));
			$i += 1;
		} else {
			$i += 1;
		}
	}

	return join('', @top_order_dd);
}

1;
