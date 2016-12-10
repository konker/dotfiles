#!/usr/bin/env perl

use strict;
use warnings;

my $filename = '~/.aws/credentials';

# extract keys
my $in_section = 0;
my $cur_section;
my ($cur_id, $cur_secret);

my ($section_to_load) = @ARGV;

if (not defined $section_to_load) {
    print("export AWS_ACCESS_KEY_ID=\n");
    print("export AWS_SECRET_ACCESS_KEY=\n");
}
else {
    # read in credentials file
    open(my $fh, "<", glob($filename)) or die "Can't open < $filename $!";

    while (my $line = <$fh>)  {
        chomp($line);

        if ($line =~ /\[(.+)\]/) {
            $in_section = 1;
            $cur_section = $1;
        }
        elsif ($line =~ /^aws_access_key_id\s*=\s*(.*)$/i) {
            $cur_id = $1;
        }
        elsif ($line =~ /^aws_secret_access_key\s*=\s*(.*)$/i) {
            $cur_secret = $1;
        }
        else {
            if ($in_section) {
                if ($cur_section eq $section_to_load) {
                    print("export AWS_ACCESS_KEY_ID=$cur_id\n");
                    print("export AWS_SECRET_ACCESS_KEY=$cur_secret\n");

                    exit(0);
                }
                #print($cur_section, $cur_id, $cur_secret, "\n");

                $in_section = 0;
                $cur_section = '';
            }
        }
    }

    # clean up
    close $fh;
}

