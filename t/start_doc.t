#!/usr/bin/perl

use Test::More 'no_plan';

require "t/lib/transform_file.pl";

transform_file( 'minimal.pod' );