#!/usr/bin/perl

# EliteDealSeeker-Core
# User Agent: mimics a web-browser to visit sites
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

package user_agent;

use warnings;
use strict;

use FindBin qw($Bin);
use IO::Socket::INET;

my @browser_tags = ('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/540.0 (KHTML, like Gecko) Ubuntu/10.10 Chrome/8.1.0.0 Safari/540.0');

sub split_host_path($)
{
    my ($url) = @_;

        my $host;
        my $path;
        if($url =~ m/^http:\/\/([^\/]+)(\/.*)/) {
                $host = $1;
                $path = $2;
        } else {
                die "can't extract host from url\n";
        }

    return ($host, $path);
}

sub post_cookie($$$$)
{
    my ($url, $post_vars, $cookies, $cookies_new) = @_;

    my $browser_tag = $browser_tags[int rand(scalar(@browser_tags))];

    my ($host, $path) = split_host_path($url);

    # form post request
    my $body = '';
    my @keys = keys %$post_vars;
    for(my $i=0; $i<scalar(@keys); $i++) {
        if($i) {
            $body .= '&';
        }
        $body .= $keys[$i];
        $body .= '=';
        $body .= $post_vars->{$keys[$i]};
    }

    # form full request
    my $request;
    $request .= "POST $path HTTP/1.1\x0d\x0a";
    $request .= "Host: $host\x0d\x0a";
    $request .= "User-Agent: $browser_tag\x0d\x0a";
    $request .= "Accept:text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5\x0d\x0a";
    $request .= "Accept-Language: en-us,en;q=0.5\x0d\x0a";
    $request .= "Accept-Encoding: gzip,deflate\x0d\x0a";
    $request .= "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\x0d\x0a";
    $request .= "Keep-Alive: 115\x0d\x0a";
    $request .= "Content-Type: application/x-www-form-urlencoded\x0d\x0a";
    $request .= "Content-Length: ".(length $body)."\x0d\x0a\x0d\x0a";
    $request .= $body;
    
    #print $request;
    #return;

    # resolve IP address
    my $ip_packed = gethostbyname($host);
    die "can't resolve $host ($!)\n" unless defined $ip_packed;
    my $ip_string = inet_ntoa($ip_packed);

    # send request
    socket(SOCKET,PF_INET,SOCK_STREAM, (getprotobyname('tcp'))[2])
        or die "can't create a socket $!\n";
    connect(SOCKET, sockaddr_in(80, $ip_packed))
        or die "can't connect to $host!";

    print SOCKET $request;

    # no buffering
    my $temp = select SOCKET;
    $| = 1;
    print SOCKET '';
    select $temp;

    # read response, close socket
    my @lines = <SOCKET>;
    close SOCKET or die "close: $!";

    # parse cookies, write back
    foreach(@lines) {
        if(m/^Set-Cookie: ([^=]+)=([^;]+);/) {
            $cookies_new->{$1} = $2;
        }
    }

    return 1;
}

sub get($$)
{
    my ($url, $custom_headers_HR) = @_;

    my %custom_headers = ($custom_headers_HR) ? %$custom_headers_HR : ();

    my $browser_tag = $browser_tags[int rand(scalar(@browser_tags))];

    my ($host, $path) = split_host_path($url);

    # form full request
    my $request;
    $request .= "GET $path HTTP/1.1\x0d\x0a";
    $request .= "Host: $host\x0d\x0a";
    $request .= "User-Agent: $browser_tag\x0d\x0a";
    $request .= "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\x0d\x0a";
    $request .= "Accept-Language: en-us,en;q=0.5\x0d\x0a";
    $request .= "Accept-Encoding:\x0d\x0a";
    $request .= "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\x0d\x0a";
    #$request .= "Keep-Alive: 115\x0d\x0a";
    $request .= "Connection: close\x0d\x0a";
    $request .= "Referrer: $host\x0d\x0a";

    # append any additional headers (cookies, etc)
    while(my ($key, $val) = each %custom_headers) {
        $request .= "$key: $val\x0d\x0a";
    }

    # finalize
    $request .= "\x0d\x0a";

    # resolve IP address
    my $ip_packed = gethostbyname($host);
    die "can't resolve $host ($!)\n" unless defined $ip_packed;
    my $ip_string = inet_ntoa($ip_packed);

    # send request
    socket(SOCKET,PF_INET,SOCK_STREAM, (getprotobyname('tcp'))[2])
        or die "can't create a socket $!\n";
    connect(SOCKET, sockaddr_in(80, $ip_packed))
        or die "can't connect to $host!";

    print SOCKET $request;

    # no buffering
    my $temp = select SOCKET;
    $| = 1;
    print SOCKET '';
    select $temp;

    # read response, close socket
    my @lines = <SOCKET>;
    close SOCKET or die "close: $!";

    my $content = join('', @lines);

    my $index = index($content, "\x0d\x0a\x0d\x0a");
    die "parsing content from GET reply!" unless($index != -1);
    return substr($content, $index, length($content)-$index);
}



