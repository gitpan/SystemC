#!/usr/local/bin/perl -w
# DESCRIPTION: Perl ExtUtils: Type 'make test' to test this package
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

use lib '.';
use lib '..';
use IO::File;

mkdir 'test';

######################################################################
# Netlist tests

use SystemC::Netlist;

print "ok 1\n";

######################################################################

my $nl = new SystemC::Netlist ();

print "ok\n";

$nl->read_file (filename=>'testnetlist.sp',
		strip_autos=>1);
print "ok\n";

$nl->link();
$nl->autos();
$nl->lint();
print "ok\n";

######################################################################
if (1) {
    print "Checking example in Netlist.pm\n";
    my $nl = new SystemC::Netlist ();
    foreach my $file ('testnetlist.sp') {
	$nl->read_file (filename=>$file,
			strip_autos=>1);
    }
    $nl->link();
    $nl->autos();
    $nl->lint();
    $nl->exit_if_error();

    foreach my $mod ($nl->modules_sorted) {
	show_hier ($mod, "  ");
    }

    sub show_hier {
	my $mod = shift;
	my $indent = shift;
	print $indent,"Module ",$mod->name,"\n";
	foreach my $cell ($mod->cells_sorted) {
	    show_hier ($cell->submod, $indent."  ".$cell->name."  ");
	}
    }
}

######################################################################
if (1) {
    print "Checking sp_preproc (Inline mode)...\n";
    run_system ("cp testnetlist.sp test");
    run_system ("cd test && perl -Iblib/arch -Iblib/lib ../sp_preproc --inline *.sp");
}

######################################################################
if (1) {
    # sppreproc, preproc mode
    print "Checking sp_preproc (Preproc mode)...\n";
    run_system ("cp testnetlist.sp test");
    run_system ("cd test && perl -Iblib/arch -Iblib/lib ../sp_preproc --preproc *.sp");
}

######################################################################

sub run_system {
    # Run a system command, check errors
    my $command = shift;
    print "\t$command\n";
    system "$command";
    my $status = $?;
    ($status == 0) or die "%Error: Command Failed $command, $status, stopped";
}
