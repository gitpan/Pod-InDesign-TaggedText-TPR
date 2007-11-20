#!/usr/bin/perl

use Test::More 'no_plan';

require "t/lib/transform_file.pl";

$ENV{DEBUG}=0;
transform_file( 'lists.pod' );