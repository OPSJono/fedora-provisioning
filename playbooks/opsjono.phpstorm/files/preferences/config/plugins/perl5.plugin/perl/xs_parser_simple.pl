#!/usr/bin/perl
use File::Find;
use B::Deparse;

File::Find::find( \&file_processor, @INC );

my @packages = ();
sub file_processor
{
    if ($File::Find::name =~ m{auto/(.+?)/([^/]+)(dll|so)$})
    {
        my $name = $1;
        $name =~ s{/+}{::}g;
        return if $name =~ /\QType::Tiny::XS\E/; # see https://github.com/tobyink/p5-type-tiny-xs/issues/4
        #        print STDERR "Processing $name\n";
        eval "require $name;";
        if (my $e = $@)
        {
            print STDERR "Error loading $name:\n$e\n";
        }
    }
}

my $deparser = B::Deparse->new();
my %sub_map = ();

print <<'EOM';
#
#
# DO NOT EDIT THIS FILE, IT'S AUTOGENERATED FROM XS MODULES AND WILL BE UPDATED AUTOMATICALLY
#
#
EOM


foreach my $globname (sort @{get_typeglobs_snapshot()})
{
    next if $globname =~ /::bootstrap/;
    next if $globname =~ /[^\w\:_]/;

    if (*{$globname}{CODE})
    {
        my $deparsed = eval {$deparser->coderef2text( \&{$globname} )};
        # too messy
#        if( my $e = $@ )
#        {
#            print STDERR "Error deparsing $globname:\n$e\n";
#        }

        if ($deparsed =~ /^(?:\(.*?\))?\s*;$/)
        {
            $globname =~ s/^:://;
            $globname =~ /^(.+)::([^:]+)$/;
            my ($package, $sub) = ($1, $2);
            $sub_map{$package} //= [ ];
            push @{$sub_map{$package}}, $sub.$deparsed;
        }
    }
}

foreach my $package (sort keys %sub_map)
{

    print "package $package {\n";
    foreach my $sub_name (sort @{$sub_map{$package}})
    {
        print "sub $sub_name\n";
    }
    print "}\n";
}

sub get_typeglobs_snapshot
{
    my $namespace = shift // "";
    my $recursion_map = shift // { qw/::main/ };

    $namespace =~ s/::$//;

    return [ ] if (exists $recursion_map->{$namespace});
    $recursion_map->{$namespace} = 1;

    my $result = [ ];

    foreach my $name (keys %{"${namespace}::"})
    {
        my $canonical_name = "${namespace}::$name";
        if ($name =~ /::$/)
        {
            push @{$result}, @{get_typeglobs_snapshot( $canonical_name, $recursion_map )};
        }
        else
        {
            push @{$result}, $canonical_name;
        }
    }

    return $result;
}
