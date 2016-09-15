local $x = 'global';

sub print_x {
    print "x = $x\n";
}

sub f {
    local $x = "f";
    print_x();
}

print_x();
f()
